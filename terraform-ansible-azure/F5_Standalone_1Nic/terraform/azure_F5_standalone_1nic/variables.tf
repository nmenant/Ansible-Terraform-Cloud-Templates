variable "azure_rg_name" {
    type = "string"
}
variable "f5_username" {
  description = "user of the F5 admin that will be created"
  default = "azureuser"
}
variable "azure_region" {
  type = "string"
}

variable "subnet1_public_id" {
  type = "string"
}
variable "AllowedIPs" {
  type = "string"
}

variable "f5_instance_type" {
  type = "string"
}

variable "f5_image_name" {
  type = "string"
}
variable "f5_version" {
  type = "string"
}

variable "f5_product_name" {
  type = "string"
}

variable libs_dir { 
  default = "/config/cloud/azure/node_modules" 
}
variable onboard_log { 
  default = "/var/log/startup-script.log" 
}

variable "f5_ssh_publickey" {
  description = "public key to login as var.f5_username"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbfw73VHrRi9M+PlzpEW1ROrQkVYbIicoMrNeFHhgLc5aR4FOMvkUh924OcAvnalTASw0KSNAM7CaoSFcE1F/zPTHUnwCY/4liS9qenBeHBqeH1K7aBlaOb0V36zdlnUqRUzq/tL5J4TZkSyBntcKjRKlksxJrsPHvJSs/l36ryqmtyhzi5tLgnEvAKq8NCowpJKn2tornN52cYrf6JJhHRrQp/Cd5b5NXvAkde0mtsqkq6kwFSJwXr1+A2BxmabApDXSq0e0f5pjp0sXBSLweIWqHtFHXY53LGUBwsqvMiL4ijdgRNLTb9OWMtL4Pxy8qjC7Hsxb4iVPFZ9PmDJT3"
}
variable "owner" {
  type = "string"
}
