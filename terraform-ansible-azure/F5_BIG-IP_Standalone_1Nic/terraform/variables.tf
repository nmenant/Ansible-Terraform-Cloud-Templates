variable "owner" {}

variable "project_name" {}

##
##  
## List of regions : francecentral, westeurope, westus2
## Can get the list of region with the command: az account list-locations
##
variable "azure_region" {}

variable "AllowedIPs" {}

variable "key_path" {}

variable "azure_az1" {}

variable "azure_az2" {}

##
## Variables related to the Ubuntu deployment
##

variable "ubuntu_instance_count" {
  description = "How many ubuntu instances do you want to start per AZ"
  default     = "1"
}

variable "ubuntu_instance_size" {
  description = "How many ubuntu instances do you want to start per AZ"
  default     = "Standard_DS1_v2"
}

variable "app_tag_value" {}

##
## F5 variables related to the F5 BIG-IP deployment
##
variable "f5_instance_type" {
  description = "instance type for F5 VM to be deployed"
  default     = "Standard_DS4_v2"
}

variable "f5_version" {}

variable "f5_image_name" {}

variable "f5_product_name" {}

## Please check and update the latest DO URL from https://github.com/F5Networks/f5-declarative-onboarding/releases
variable "DO_URL" {
  default = "https://github.com/nmenant/Public-Cloud-Templates/raw/master/tools/f5-declarative-onboarding-1.4.0-1.noarch.rpm"
}

## Please check and update the latest AS3 URL from https://github.com/F5Networks/f5-appsvcs-extension/releases/latest 
variable "AS3_URL" {
  default = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.12.0/f5-appsvcs-3.12.0-5.noarch.rpm"
}


