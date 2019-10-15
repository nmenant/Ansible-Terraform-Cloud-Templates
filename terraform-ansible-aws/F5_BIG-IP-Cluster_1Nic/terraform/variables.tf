variable "owner" {}

variable "project_name" {}

variable "key_path" {}

variable "AllowedIPs" {}

variable "aws_region" {}

variable "aws_az1" {}

variable "aws_az2" {}

variable "f5_name_filter" {}

##
## Description of VPC CIDR and private/public subnets
## Each private/public subnet will be assigned to a different AZ
##
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

##
## Ubuntu instance setup
## 

variable "ubuntu_instance_count" {
    description = "How many ubuntu instances do you want to start per AZ"
    default = "1"
}

variable "ubuntu_instance_name" {
    description = "Name for your Ubuntu instances"
    default = "Ubuntu-NGINX"
}

##
## Will influence F5 onboarding setup and which iControl Extension
## should be loaded by default
## 

variable "f5_instance_type" {
  default = "m5.xlarge"
}

variable "bigip_https_port" {
    description = "TCP Port use to access BIG-IP GUI or API"
    default = "8443"
}

## Please check and update the latest DO URL from https://github.com/F5Networks/f5-declarative-onboarding/releases
variable "DO_URL" {
  default = "https://github.com/F5Networks/f5-declarative-onboarding/releases/download/v1.7.0/f5-declarative-onboarding-1.7.0-3.noarch.rpm"
}

## Please check and update the latest AS3 URL from https://github.com/F5Networks/f5-appsvcs-extension/releases/latest 
variable "AS3_URL" {
  default = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.13.2/f5-appsvcs-3.13.2-1.noarch.rpm"
}

variable "HA_URL" {
  default = "https://github.com/nmenant/Ansible-Terraform-Cloud-Templates/raw/terraform-0.12-aws-bigip-cluster/tools/develop-f5-cloud-failover-0.9.1-1.noarch.rpm"
}

variable "app_tag_value" {}

