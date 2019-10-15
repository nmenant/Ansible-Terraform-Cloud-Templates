output "vpc_id" {
  value = module.aws_vpc.vpc_default_id
}

output "public_subnet1_id" {
  value = module.aws_vpc.public_subnet1_id
}

output "public_subnet2_id" {
  value = module.aws_vpc.public_subnet2_id
}

output "private_subnet1_id" {
  value = module.aws_vpc.private_subnet1_id
}

output "private_subnet2_id" {
  value = module.aws_vpc.private_subnet2_id
}

output "key_name" {
  value = module.aws_vpc.key_name
}

output "ubuntu_public_ips" {
  value = module.aws_ubuntu_systems.ubuntu_public_ips
}

output "ubuntu_private_ips" {
  value = module.aws_ubuntu_systems.ubuntu_private_ips
}

output "f5_public_ips" {
  value = module.aws_f5_cluster.f5_public_ips
}

output "f5_private_ips" {
  value = module.aws_f5_cluster.f5_private_ips
}

output "allowed_ips" {
  value = var.AllowedIPs
}

