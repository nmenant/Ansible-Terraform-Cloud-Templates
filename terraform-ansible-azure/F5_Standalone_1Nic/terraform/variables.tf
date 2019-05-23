variable "owner" {
  description = "Name of the owner of this deployment (no space)"
  default     = "NicoM"
}

variable "project_name" {
  description = "Name of the project related to this VPC"
  default     = "Terraform"
}

##
## List of regions : francecentral, westeurope, westus2
## Can get the list of region with the command: az account list-locations
##
variable "azure_region" {
  default = "francecentral"
}

variable "AllowedIPs" {
  description = "Public IPs used to access your instances"
  default     = "109.7.65.101/32"
}

variable "public_key" {
  description = "SSH Public Key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbfw73VHrRi9M+PlzpEW1ROrQkVYbIicoMrNeFHhgLc5aR4FOMvkUh924OcAvnalTASw0KSNAM7CaoSFcE1F/zPTHUnwCY/4liS9qenBeHBqeH1K7aBlaOb0V36zdlnUqRUzq/tL5J4TZkSyBntcKjRKlksxJrsPHvJSs/l36ryqmtyhzi5tLgnEvAKq8NCowpJKn2tornN52cYrf6JJhHRrQp/Cd5b5NXvAkde0mtsqkq6kwFSJwXr1+A2BxmabApDXSq0e0f5pjp0sXBSLweIWqHtFHXY53LGUBwsqvMiL4ijdgRNLTb9OWMtL4Pxy8qjC7Hsxb4iVPFZ9PmDJT3"
}

## Please check and update the latest DO URL from https://github.com/F5Networks/f5-declarative-onboarding/releases
variable "DO_URL" {
  default = "https://github.com/nmenant/Public-Cloud-Templates/raw/master/tools/f5-declarative-onboarding-1.4.0-1.noarch.rpm"
}

## Please check and update the latest AS3 URL from https://github.com/F5Networks/f5-appsvcs-extension/releases/latest 
variable "AS3_URL" {
  default = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.11.0/f5-appsvcs-3.11.0-3.noarch.rpm"
}

variable "azure_az1" {
  default = "1"
}

variable "azure_az2" {
  default = "2"
}

variable "f5_instance_type" {
  description = "instance type for F5 VM to be deployed"
  default     = "Standard_DS4_v2"
}

variable "f5_version" {
  description = "BIG-IP Version"
  default     = "latest"
}

variable "f5_image_name" {
  description = "BIG-IP Image name"
  default     = "f5-bigip-virtual-edition-200m-best-hourly"
}

variable "f5_product_name" {
  description = "BIG-IP product name"
  default     = "f5-big-ip-best"
}

variable "ubuntu_instance_count" {
  description = "How many ubuntu instances do you want to start per AZ"
  default     = "1"
}

