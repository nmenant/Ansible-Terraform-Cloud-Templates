provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "ubuntu_instance" {
  count = "${var.instance_count}"
  ami = "${lookup(var.amis, var.aws_region)}"
  subnet_id = "${var.subnet_id}"
  key_name = "${var.key_name}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.ubuntu_sg.id}"]
  tags {
    Name = "Ubuntu-terraform-${format("%02d", count.index+1)}"
  }
}

output "ec2_public_ips" {
  value = ["${aws_instance.ubuntu_instance.*.public_ip}"]
}
