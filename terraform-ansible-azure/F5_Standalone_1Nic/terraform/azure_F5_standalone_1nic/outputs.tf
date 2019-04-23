output "f5_public_ip" {
  value = "${azurerm_public_ip.bigip1_public_ip.ip_address}"
}

output "f5_username" {
  value = "${var.f5_username}"
}