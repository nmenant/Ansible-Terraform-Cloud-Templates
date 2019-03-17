variable "vpc_id" {
    description = "AWS VPC for hosting your system(s)"
    default = "vpc-00b0b16361f35c81f"
}
variable "key_name" {
    description = "Key name for SSHing into EC2"
    default = "NicoKeyPair-USWest2"
}
variable "aws_region" {
  default = "us-west-2"
}
variable "amis" {
    description = "Base AMI to launch the instances"
    default = {
        us-west-2 = "ami-0f2016003e1759f35"
        eu-west-1 = "ami-03d57c34293448f40"
    }
}
variable "instance_name" {
    description = "Name for your instances"
    default = "nico_ubuntu"
}

variable "subnet_id" {
    description = "ID of the subnet to use for the instances"
    default = "subnet-069f7f335772d2490"
}
variable "AllowedIPs" {
    description = "Public IPs used to access your instances"
    default = "90.79.84.177/32"
}
variable "instance_count" {
    description = "How many instances do you want to start"
    default = "2"
}

variable "tag_identifier" {
    description = "tag assigned to all the generated instances"
    default = "Nico Terraform"
}
