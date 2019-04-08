variable "owner" {
  description = "Name of the owner of this deployment (no space)"
  default = "NicoM"
}

variable "project_name" {
  description = "Name of the project related to this VPC"
  default = "TestTerraform"
}

variable "s3_aws_region" {
  description = "region for the S3 bucket used to store the state. eu-west-3 is Paris"
  default = "eu-west-3"
}

variable "azure_az1" {
  default = "1"
}

variable "azure_az2" {
  default = "2"
}

variable "s3_bucket" {
  description = "name of the S3 bucket"
  default = "nmenant-private"
}

variable "s3_path" {
  description = "Path in the bucket to store the terraform state"
  default = "terraform/aws"
}
##
## List of regions : francecentral, westeurope, westus2
## Can get the list of region with the command: az account list-locations
##
variable "azure_region" {
  default = "francecentral"
}

variable "public_key" {
  description = "SSH Public Key"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbfw73VHrRi9M+PlzpEW1ROrQkVYbIicoMrNeFHhgLc5aR4FOMvkUh924OcAvnalTASw0KSNAM7CaoSFcE1F/zPTHUnwCY/4liS9qenBeHBqeH1K7aBlaOb0V36zdlnUqRUzq/tL5J4TZkSyBntcKjRKlksxJrsPHvJSs/l36ryqmtyhzi5tLgnEvAKq8NCowpJKn2tornN52cYrf6JJhHRrQp/Cd5b5NXvAkde0mtsqkq6kwFSJwXr1+A2BxmabApDXSq0e0f5pjp0sXBSLweIWqHtFHXY53LGUBwsqvMiL4ijdgRNLTb9OWMtL4Pxy8qjC7Hsxb4iVPFZ9PmDJT3"
}

variable "AllowedIPs" {
    description = "Public IPs used to access your instances"
    default = "109.190.253.11/32"
}
