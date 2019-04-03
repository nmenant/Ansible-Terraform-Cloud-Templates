output "f5_standalone_cft" {
  value = "${aws_cloudformation_stack.f5-standalone-hourly.outputs}"
}

output "f5_public_ip" {
  value = "${aws_cloudformation_stack.f5-standalone-hourly.outputs["Bigip1subnet1Az1SelfEipAddress"]}"
}
output "f5_private_ip" {
  value = "${aws_cloudformation_stack.f5-standalone-hourly.outputs["Bigip1ExternalInterfacePrivateIp"]}"
}