#variable "vpc_id" {
#    description = "AWS VPC for hosting your system(s)"
#    default = "vpc-00b0b16361f35c81f"
#}
#variable "key_name" {
#    description = "Key name for SSHing into EC2"
#    default = "NicoKeyPair-USWest2"
#}
#variable "aws_region" {
#  default = "us-west-2"
#}

variable "amis" {
    description = "Base AMI to launch the ubuntu instances"
    default = {
        us-west-2 = "ami-0f2016003e1759f35"
        eu-west-1 = "ami-03d57c34293448f40"
    }
}
variable "ubuntu_instance_name" {
    description = "Name for your Ubuntu instances"
    default = "nico_ubuntu"
}

variable "ubuntu_instance_count" {
    description = "How many ubuntu instances do you want to start per AZ"
    default = "1"
}

variable "tag_identifier" {
    description = "tag assigned to all the generated instances"
    default = "Nico Terraform"
}

variable "aws_region" {
  type = "string"
}
variable "ubuntu_subnet_id_az1" {
  type = "string"
}
variable "ubuntu_subnet_id_az2" {
  type = "string"
}
variable "key_name" {
  type = "string"
}
variable "vpc_id" {
  type = "string"
}
variable "AllowedIPs" {
  type = "string"
}

variable "owner" {
  type = "string"
}

variable "public_subnet1_cidr" {
  type = "string"
}
variable "public_subnet2_cidr" {
  type = "string"
}
variable "private_subnet1_cidr" {
  type = "string"
}
variable "private_subnet2_cidr" {
  type = "string"
}