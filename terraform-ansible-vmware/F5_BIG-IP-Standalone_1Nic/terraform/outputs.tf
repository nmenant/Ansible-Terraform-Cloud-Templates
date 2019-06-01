output "vmware_datacenter" {
  value = var.vmware_datacenter
}

output "vmware_ubuntu_private_ips" {
  value = module.vmware_ubuntu_systems.ubuntu_private_ips
}