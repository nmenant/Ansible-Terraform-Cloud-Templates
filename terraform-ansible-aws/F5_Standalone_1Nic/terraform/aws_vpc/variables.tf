variable "vpc_cidr" {
    description = "AWS VPC CIDR"
    default = "10.10.0.0/16"
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
variable "aws_region" {
  type = "string"
}
variable "key_path" {
  type = "string"
}
variable "aws_az1" {
  type = "string"
}
variable "aws_az2" {
  type = "string"
}

variable "owner" {
  type = "string"
}

