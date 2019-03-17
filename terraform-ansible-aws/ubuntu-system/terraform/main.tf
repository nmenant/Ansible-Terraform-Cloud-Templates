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
    Environmnent = "${var.tag_identifier}"
  }
}

#resource "template_file" "system_ansible" {
#  count = "${length(split(",","${data.aws_instances.list_public_ips.public_ips}"))}"
#  template = "${file("../ansible/inventory/hostname.tpl")}"
#  vars {
#    index = "${count.index + 1}"
#    name  = "system"
#    extra = " ansible_host=${element(split(",","${data.aws_instances.list_public_ips.public_ips}"),count.index)}"
#  }
#}

#resource "template_file" "ansible_inventory" {
#  template = "${file("../ansible/inventory//ansible_hosts.tpl")}"
#  vars {
#    system_hosts   = "${join("\n",template_file.system_ansible.*.rendered)}"
#  }
#}
#data "aws_instances" "list_public_ips" {
#  instance_tags {
#    Environment = "${var.tag_identifier}"
#  }
#}

#output "ansible_inventory" {
#	value = "${template_file.ansible_inventory.rendered}"
#}

output "systems_public_ips" {
  value = ["${aws_instance.ubuntu_instance.*.public_ip}"]
}