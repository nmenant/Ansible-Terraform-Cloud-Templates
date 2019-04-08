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
#module "aws_f5_standalone" {
#  source = "./aws_F5_standalone_1nic"
#  aws_region = "${var.aws_region}"
#  vpc_id =  "${module.aws_vpc.vpc_default_id}"
#  f5_subnet1_id = "${module.aws_vpc.public_subnet1_id}"
#  key_name = "${module.aws_vpc.key_name}"
#  owner = "${var.owner}-${var.project_name}"
#  AllowedIPs = "${var.AllowedIPs}"
#}

module "azure_ressourcegroup" {
  source = "./azure_ressourcegroup"
  owner = "${var.owner}-${var.project_name}"
  azure_region = "${var.azure_region}"
}

module "azure_ubuntu_systems" {
  source = "./azure_ubuntu_systems"
  azure_region = "${var.azure_region}"
  owner = "${var.owner}-${var.project_name}"
  ubuntu_subnet_id_az1 = "${var.azure_az1}"
  ubuntu_subnet_id_az2 = "${var.azure_az2}"
  private_subnet1_id = "${module.azure_ressourcegroup.private_subnet1_id}"
  public_subnet1_cidr = "${module.azure_ressourcegroup.public_subnet1_cidr}"
#  public_subnet2_cidr = "${module.aws_vpc.public_subnet2_cidr}"
  private_subnet1_cidr = "${module.azure_ressourcegroup.private_subnet1_cidr}"
#  private_subnet2_cidr = "${module.aws_vpc.private_subnet2_cidr}"
  public_key = "${var.public_key}"
  azure_rg_name =  "${module.azure_ressourcegroup.azure_rg_name}"
  AllowedIPs = "${var.AllowedIPs}"
}

#data  "template_file" "ansible_inventory" {
#    template = "${file("./templates/ansible_inventory.tpl")}"
#    vars {
#        aws_F5_public_ip = "${module.aws_f5_standalone.f5_public_ip}" 
#        aws_F5_private_ip = "${module.aws_f5_standalone.f5_private_ip}"
#        aws_ubuntu_data = "${join("\n", "${module.aws_ubuntu_systems.ubuntu_public_ips}")}"
#    }
#}
#resource "local_file" "ansible_inventory_file" {
#  content  = "${data.template_file.ansible_inventory.rendered}"
#  filename = "../ansible/playbooks/inventory/hosts"
#}

#data  "template_file" "ansible_f5_vars" {
#    template = "${file("./templates/ansible_f5_vars.tpl")}"
#    vars {
#        aws_f5_pool_members = "${join("','", "${module.aws_ubuntu_systems.ubuntu_private_ips}")}"
#    }
#}
#resource "local_file" "ansible_f5_vars_file" {
#  content  = "${data.template_file.ansible_f5_vars.rendered}"
#  filename = "../ansible/playbooks/group_vars/F5_systems/vars"
#}