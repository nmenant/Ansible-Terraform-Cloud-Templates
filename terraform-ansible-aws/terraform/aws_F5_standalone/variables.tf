variable "vpc_id" {
    description = "AWS VPC for hosting your system(s)"
    default = "vpc-00b0b16361f35c81f"
}
variable "aws_region" {
  default = "us-west-2"
}
variable "f5_subnet_id1" {
    description = "ID of the subnet1 to use for the first F5 interface"
    default = "subnet-069f7f335772d2490"
}
variable "key_name" {
    description = "Key name for SSHing into EC2"
    default = "NicoKeyPair-USWest2"
}

variable "instance_name" {
    description = "Name of the F5 instances"
    default = "Nico"
}
variable "AllowedIPs" {
    description = "Public IPs used to access your instances"
    default = "92.151.104.142/32"
}

variable "bigip_https_port" {
    description = "TCP Port use to access BIG-IP GUI or API"
    default = "8443"
}
variable "ntp_pool" {
    description = "NTP Server"
    default = "pool.ntp.org"
}

variable "AS3_declaration_url" {
    description = "AS3 URL for App services configuration"
    default = "none"
}

variable "owner" {
    description = "Owner name of those instances"
    default = "Nico"
}