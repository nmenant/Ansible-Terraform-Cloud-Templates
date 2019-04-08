
output "ubuntu_public_az1_ips" {
  value = ["${azurerm_public_ip.ubuntu_az1_publicips.*.ip_address}"]
}
output "ubuntu_public_az2_ips" {
  value = ["${azurerm_public_ip.ubuntu_az2_publicips.*.ip_address}"]
}
output "ubuntu_public_ips" {
  value = ["${azurerm_public_ip.ubuntu_az1_publicips.*.ip_address}", "${azurerm_public_ip.ubuntu_az2_publicips.*.ip_address}"]
}
output "ubuntu_private_az1_ips" {
  value = ["${azurerm_network_interface.ubuntu_az1_privatenics.*.id}"]
}
output "ubuntu_private_az2_ips" {
  value = ["${azurerm_network_interface.ubuntu_az2_privatenics.*.id}"]
}
output "ubuntu_private_ips" {
  value = ["${azurerm_network_interface.ubuntu_az1_privatenics.*.private_ip_address}", "${azurerm_network_interface.ubuntu_az2_privatenics.*.private_ip_address}"]
}