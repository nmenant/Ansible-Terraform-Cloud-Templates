variable "owner" {
  description = "Name of the owner of this deployment (no space)"
  default = "NicoM"
}

variable "project_name" {
  description = "Name of the project related to this VPC"
  default = "TestTerraform"
}


variable "aws_az1" {
  default = "eu-west-1b"
}

variable "aws_az2" {
  default = "eu-west-1c"
}

variable "aws_region" {
  default = "eu-west-1"
}
variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/menant/.ssh/id_rsa.pub"
}

variable "AllowedIPs" {
    description = "Public IPs used to access your instances"
    default = "90.120.18.213/32"
}

## Please check and update the latest DO URL from https://github.com/F5Networks/f5-declarative-onboarding/releases
variable DO_URL	{ 
  default = "https://github.com/nmenant/Public-Cloud-Templates/raw/Development/tools/f5-declarative-onboarding-1.3.0-3.noarch.rpm"
}

## Please check and update the latest AS3 URL from https://github.com/F5Networks/f5-appsvcs-extension/releases/latest 
variable AS3_URL { 
  default = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.10.0/f5-appsvcs-3.10.0-5.noarch.rpm" 
}

variable "f5_instance_type" {
  default = "m5.xlarge"
}
variable "app_tag_value" {
  description = "Value assigned to the tag key Application - will be used by AS3 Service Discovery"
  default = "www-NGINX"
}