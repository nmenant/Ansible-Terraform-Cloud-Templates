##
## azurerm provides the information to target a specific subscription/appid/tenantid/... 
## fill it if you haven't setup env variables to provide this information
##
##provider "azurerm" {
##    subscription_id = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
##    client_id       = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
##    client_secret   = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
##    tenant_id       = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
##}
provider "azurerm" {
}
module "azure_f5_standalone" {
  source            = "./azure_F5_standalone_1nic"
  azure_region      = "${var.azure_region}"
  azure_rg_name     =  "${module.azure_ressourcegroup.azure_rg_name}"
  subnet1_public_id = "${module.azure_ressourcegroup.public_subnet1_id}"
  owner             = "${var.owner}-${var.project_name}"
  AllowedIPs        = "${var.AllowedIPs}"
  f5_instance_type  = "${var.f5_instance_type}"
  f5_version        = "${var.f5_version}"
  f5_image_name     = "${var.f5_image_name}"
  f5_product_name   = "${var.f5_product_name}"
  DO_URL            = "${var.DO_URL}"
  AS3_URL           = "${var.AS3_URL}"
  f5_ssh_publickey  = "${var.public_key}"
}

module "azure_ressourcegroup" {
  source        = "./azure_ressourcegroup"
  owner         = "${var.owner}-${var.project_name}"
  azure_region  = "${var.azure_region}"
}

module "azure_ubuntu_systems" {
  source                = "./azure_ubuntu_systems"
  azure_region          = "${var.azure_region}"
  owner                 = "${var.owner}-${var.project_name}"
  ubuntu_subnet_id_az1  = "${var.azure_az1}"
  ubuntu_subnet_id_az2  = "${var.azure_az2}"
  private_subnet1_id    = "${module.azure_ressourcegroup.private_subnet1_id}"
  public_subnet1_cidr   = "${module.azure_ressourcegroup.public_subnet1_cidr}"
#  public_subnet2_cidr  = "${module.aws_vpc.public_subnet2_cidr}"
  private_subnet1_cidr  = "${module.azure_ressourcegroup.private_subnet1_cidr}"
#  private_subnet2_cidr = "${module.aws_vpc.private_subnet2_cidr}"
  public_key            = "${var.public_key}"
  azure_rg_name         =  "${module.azure_ressourcegroup.azure_rg_name}"
  AllowedIPs            = "${var.AllowedIPs}"
  ubuntu_instance_count = "${var.ubuntu_instance_count}"
}

data  "template_file" "ansible_inventory" {
  template = "${file("./templates/ansible_inventory.tpl")}"
  vars {
    azure_F5_public_ip = "${module.azure_f5_standalone.f5_public_ip}" 
    azure_F5_private_ip = "${module.azure_f5_standalone.f5_private_ip}"
    azure_ubuntu_data = "${join("\n", "${module.azure_ubuntu_systems.ubuntu_public_ips}")}"
  }
}

resource "local_file" "ansible_inventory_file" {
  content  = "${data.template_file.ansible_inventory.rendered}"
  filename = "../ansible/playbooks/inventory/hosts"
}

data  "template_file" "ansible_f5_vars" {
  template = "${file("./templates/ansible_f5_vars.tpl")}"
  vars {
    azure_f5_pool_members = "${join("','", "${module.azure_ubuntu_systems.ubuntu_private_ips}")}"
  }
}
resource "local_file" "ansible_f5_vars_file" {
  content  = "${data.template_file.ansible_f5_vars.rendered}"
  filename = "../ansible/playbooks/group_vars/F5_systems/vars"
}