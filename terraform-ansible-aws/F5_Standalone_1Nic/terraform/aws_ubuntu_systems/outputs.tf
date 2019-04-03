
output "ubuntu_public_az1_ips" {
  value = ["${aws_instance.ubuntu_instance_az1.*.public_ip}"]
}
output "ubuntu_public_az2_ips" {
  value = ["${aws_instance.ubuntu_instance_az2.*.public_ip}"]
}
output "ubuntu_public_ips" {
  value = ["${aws_instance.ubuntu_instance_az1.*.public_ip}", "${aws_instance.ubuntu_instance_az2.*.public_ip}"]
}
output "ubuntu_private_az1_ips" {
  value = ["${aws_instance.ubuntu_instance_az1.*.private_ip}"]
}
output "ubuntu_private_az2_ips" {
  value = ["${aws_instance.ubuntu_instance_az2.*.private_ip}"]
}
output "ubuntu_private_ips" {
  value = ["${aws_instance.ubuntu_instance_az1.*.private_ip}", "${aws_instance.ubuntu_instance_az2.*.private_ip}"]
}