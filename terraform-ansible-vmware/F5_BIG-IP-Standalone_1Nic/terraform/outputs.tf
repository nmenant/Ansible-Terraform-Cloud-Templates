output "vmware_datacenter" {
  value = var.vmware_datacenter
}

output "vmware_ubuntu_private_ips" {
  value = module.vmware_ubuntu_systems.ubuntu_private_ips
}

output "vmware_f5_private_ip" {
  value = module.vmware_F5_standalone_1nic.f5_private_ip
}