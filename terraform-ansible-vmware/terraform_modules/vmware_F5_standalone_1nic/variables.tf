variable "owner" {
  type = "string"
}

variable "vmware_datacenter" {
  type = "string"
}
variable "vmware_cluster" {
  type = "string"
}
variable "vmware_f5_datastore" {
  type = "string"
}
variable "vmware_f5_network_name" {
  type = "string"
}
variable "vmware_f5_bigip_template_name" {
  type = "string"
}
variable "ssh_public_key" {
  type = "string"
}

variable "f5_instance_name" {
    type = "string"
}
variable "f5_nb_cpu" {
    type = "string"
}

variable "f5_memory" {
    type = "string"
}

variable libs_dir { 
  default = "/config/cloud/aws" 
}
variable onboard_log { 
  default = "/var/log/startup-script.log" 
}