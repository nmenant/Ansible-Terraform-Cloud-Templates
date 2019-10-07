
output "f5_private_ip" {
  value = vsphere_virtual_machine.f5_vm.default_ip_address
}
