output "f5_public_ips" {
  value = concat(aws_instance.f5_bigip1[*].public_ip, aws_instance.f5_bigip2[*].public_ip)
}
output "f5_private_ips" {
  value = concat(aws_instance.f5_bigip1[*].private_ip, aws_instance.f5_bigip2[*].private_ip)
}