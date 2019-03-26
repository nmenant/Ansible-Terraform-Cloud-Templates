
output "ubuntu_public_az1_ips" {
  value = ["${aws_instance.ubuntu_instance_az1.*.public_ip}"]
}
output "ubuntu_public_az2_ips" {
  value = ["${aws_instance.ubuntu_instance_az2.*.public_ip}"]
}