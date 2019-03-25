variable "owner" {
  description = "Name of the owner of this deployment (no space)"
  default = "NicoM"
}

variable "vpc_cidr" {
    description = "AWS VPC CIDR"
    default = "10.10.0.0/16"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_az1" {
  default = "eu-west-1b"
}

variable "aws_az2" {
  default = "eu-west-1c"
}


variable "public_subnet1_cidr" {
  description = "First public subnet IP range"
  default = "10.10.10.0/24"
}

variable "public_subnet2_cidr" {
  description = "2nd public subnet IP range"
  default = "10.10.11.0/24"
}

variable "private_subnet1_cidr" {
  description = "2nd public subnet IP range"
  default = "10.10.20.0/24"
}

variable "private_subnet2_cidr" {
  description = "2nd public subnet IP range"
  default = "10.10.21.0/24"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/menant/.ssh/id_rsa.pub"
}
