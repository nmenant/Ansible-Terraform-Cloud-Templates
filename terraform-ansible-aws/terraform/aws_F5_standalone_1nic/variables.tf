variable "vpc_id" {
    type = "string"
}
variable "aws_region" {
  type = "string"
}
variable "f5_subnet1_id" {
  type = "string"
}
variable "key_name" {
  type = "string"
}
variable "instance_name" {
  description = "Name of the F5 instances"
  default = "Nico"
}
variable "AllowedIPs" {
  type = "string"
}

variable "bigip_https_port" {
    description = "TCP Port use to access BIG-IP GUI or API"
    default = "8443"
}
variable "ntp_pool" {
    description = "NTP Server"
    default = "pool.ntp.org"
}

variable "AS3_declaration_url" {
    description = "AS3 URL for App services configuration"
    default = "none"
}

variable "owner" {
  type = "string"
}