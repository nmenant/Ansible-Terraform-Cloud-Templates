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

#Public IPS to reach F5 Mgmt Interface
output "f5_public_ips_mgmt" {
  value = module.aws_f5_cluster.f5_bigip_public_ips_mgmt
  }

#Public IP to reach the deployed app
output "f5_public_ips_app" {
  value = module.aws_f5_cluster.f5_bigip_public_ips_app
}

#Private IPs related to the deployed app
output "f5_private_ips_app" {
  value = module.aws_f5_cluster.f5_bigip_private_ips_app
}

output "allowed_ips" {
  value = var.AllowedIPs
}

