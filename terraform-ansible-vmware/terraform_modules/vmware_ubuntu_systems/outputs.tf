
output "ubuntu_private_ips" {
  value = vsphere_virtual_machine.ubuntu_vms[*].default_ip_address
}
