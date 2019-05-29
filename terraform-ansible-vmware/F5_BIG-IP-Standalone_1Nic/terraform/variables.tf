variable "owner" {}

variable "project_name" {}

variable vmware_datacenter {}

variable vmware_cluster {}

variable vmware_f5_datastore {}

//variable vmware_f5_resource_pool {}

variable vmware_f5_network_name {}

variable vmware_ubuntu_datastore {}

//variable vmware_ubuntu_resource_pool {}

variable vmware_ubuntu_network_name {}

variable "app_tag_value" {}

variable ssh_public_key {}

variable "vmware_f5_bigip_template_name" {}

variable "vmware_ubuntu_template_name" {}

##
## Ubuntu instance setup
## 
variable "domain_name" {
  description = "domain name for the deployed instances"
  default = "f5demo.local"
}

variable "ubuntu_instance_count" {
    description = "How many ubuntu instances do you want to start"
    default = "1"
}

variable "ubuntu_instance_name" {
    description = "Name for your Ubuntu instances"
    default = "Ubuntu-NGINX"
}

variable "ubuntu_nb_cpu" {
  default = "2"
}

variable "ubuntu_memory" {
  default = "1028"
}

##
## Will influence F5 onboarding setup and which iControl Extension
## should be loaded by default
## 

variable "f5_nb_cpu" {
  default = "2"
}

variable "f5_memory" {
  default = "4096"
}

variable "bigip_https_port" {
    description = "TCP Port use to access BIG-IP GUI or API"
    default = "8443"
}

## Please check and update the latest DO URL from https://github.com/F5Networks/f5-declarative-onboarding/releases
variable "DO_URL" {
  default = "https://github.com/nmenant/Public-Cloud-Templates/raw/master/tools/f5-declarative-onboarding-1.4.0-1.noarch.rpm"
}

## Please check and update the latest AS3 URL from https://github.com/F5Networks/f5-appsvcs-extension/releases/latest 
variable "AS3_URL" {
  default = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.11.0/f5-appsvcs-3.11.0-3.noarch.rpm"
}


