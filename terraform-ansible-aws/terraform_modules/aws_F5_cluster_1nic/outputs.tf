output "f5_bigip_public_ips_mgmt" {
  value = concat(aws_eip.f5_bigip1_mgmt[*].public_ip, aws_eip.f5_bigip2_mgmt[*].public_ip)
}

output "f5_bigip_public_ips_app" {
  value = aws_eip.f5_bigip1_app.public_ip
}
output "f5_bigip_private_ips" {
  value = concat(aws_network_interface.f5_bigip1_interface[*].private_ips,aws_network_interface.f5_bigip2_interface[*].private_ips)
}

output "f5_bigip_private_ips_app" {
  value = ["${tolist(aws_network_interface.f5_bigip1_interface.private_ips)[1] == aws_instance.f5_bigip1.private_ip ? tolist(aws_network_interface.f5_bigip1_interface.private_ips)[2] : tolist(aws_network_interface.f5_bigip1_interface.private_ips)[1]}","${tolist(aws_network_interface.f5_bigip2_interface.private_ips)[2] == aws_instance.f5_bigip2.private_ip ? tolist(aws_network_interface.f5_bigip2_interface.private_ips)[1] : tolist(aws_network_interface.f5_bigip2_interface.private_ips)[2]}"]
}

output "f5_bigip_hostnames" {
  value = [ aws_instance.f5_bigip1.private_dns, aws_instance.f5_bigip2.private_dns ] 
}

output "f5_bigip_selfips" {
  value = [ aws_instance.f5_bigip1.private_ip, aws_instance.f5_bigip2.private_ip]
}

