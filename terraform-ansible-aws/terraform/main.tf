module "aws_ubuntu_systems" {
  source = "aws_ubuntu_systems"
}

output "ubuntu_ips" {
    value = "${module.aws_ubuntu_systems.ubuntu_public_ips}"
}