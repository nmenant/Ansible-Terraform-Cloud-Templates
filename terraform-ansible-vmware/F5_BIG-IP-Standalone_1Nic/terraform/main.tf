provider "vsphere" {
  allow_unverified_ssl = true
}

module "vmware_ubuntu_systems" {
  source                          = "../../terraform_modules/vmware_ubuntu_systems"
  owner                           = "${var.owner}-${var.project_name}"
  vmware_datacenter               = var.vmware_datacenter
  vmware_cluster                  = var.vmware_cluster
  vmware_ubuntu_template_name     = var.vmware_ubuntu_template_name
  vmware_ubuntu_datastore         = var.vmware_ubuntu_datastore
  vmware_ubuntu_network_name      = var.vmware_ubuntu_network_name
  ssh_public_key                  = var.ssh_public_key
  app_tag_value                   = var.app_tag_value
  ubuntu_instance_count           = var.ubuntu_instance_count
  ubuntu_instance_name            = var.ubuntu_instance_name
  ubuntu_nb_cpu                   = var.ubuntu_nb_cpu
  ubuntu_memory                   = var.ubuntu_memory
  domain_name                     = var.domain_name
}

module "vmware_F5_standalone_1nic" {
  source                          = "../../terraform_modules/vmware_F5_standalone_1nic"
  owner                           = "${var.owner}-${var.project_name}"
  vmware_datacenter               = var.vmware_datacenter
  vmware_cluster                  = var.vmware_cluster
  vmware_f5_bigip_template_name   = var.vmware_f5_bigip_template_name
  vmware_f5_datastore             = var.vmware_f5_datastore
  vmware_f5_network_name          = var.vmware_f5_network_name
  ssh_public_key                  = var.ssh_public_key
  f5_instance_name                = var.f5_instance_name
  f5_nb_cpu                       = var.f5_nb_cpu
  f5_memory                       = var.f5_memory
  DO_URL                          = var.DO_URL
  AS3_URL                         = var.AS3_URL
}


data "template_file" "ansible_inventory" {
  template = file("./templates/ansible_inventory.tpl")
  vars = {
    vmware_F5_public_ip  = module.vmware_F5_standalone_1nic.f5_private_ip
    vmware_F5_private_ip = module.vmware_F5_standalone_1nic.f5_private_ip
    vmware_ubuntu_data   = join("\n", module.vmware_ubuntu_systems.ubuntu_private_ips)
  }
}

resource "local_file" "ansible_inventory_file" {
  content  = data.template_file.ansible_inventory.rendered
  filename = "../ansible/playbooks/inventory/hosts"
}

data "template_file" "ansible_f5_vars" {
  template = file("./templates/ansible_f5_vars.tpl")
  vars = {
    vmware_f5_pool_members = join("','", module.vmware_ubuntu_systems.ubuntu_private_ips)
  }
}

resource "local_file" "ansible_f5_vars_file" {
  content  = data.template_file.ansible_f5_vars.rendered
  filename = "../ansible/playbooks/group_vars/F5_systems/vars"
}


