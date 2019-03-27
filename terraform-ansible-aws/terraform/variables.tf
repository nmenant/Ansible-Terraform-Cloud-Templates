variable "owner" {
  description = "Name of the owner of this deployment (no space)"
  default = "NicoM"
}

variable "project_name" {
  description = "Name of the project related to this VPC"
  default = "Terraform"
}

variable "s3_aws_region" {
  description = "region for the S3 bucket used to store the state. eu-west-3 is Paris"
  default = "eu-west-3"
}

variable "aws_az1" {
  default = "eu-west-1b"
}

variable "aws_az2" {
  default = "eu-west-1c"
}

variable "s3_bucket" {
  description = "name of the S3 bucket"
  default = "nmenant-private"
}

variable "s3_path" {
  description = "Path in the bucket to store the terraform state"
  default = "terraform/aws"
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
    default = "92.151.104.142/32"
}