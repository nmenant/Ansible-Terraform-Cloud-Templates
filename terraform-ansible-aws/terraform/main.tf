provider "aws" {
  region = "${var.aws_region}"
}

module "aws_f5_standalone" {
  source = "./aws_F5_standalone_1nic"
  aws_region = "${var.aws_region}"
  vpc_id =  "${module.aws_vpc.vpc_default_id}"
  f5_subnet1_id = "${module.aws_vpc.public_subnet1_id}"
  key_name = "${module.aws_vpc.key_name}"
  owner = "${var.owner}-${var.project_name}"
  AllowedIPs = "${var.AllowedIPs}"
}

module "aws_vpc" {
  source = "./aws_vpc"
  owner = "${var.owner}-${var.project_name}"
  aws_region = "${var.aws_region}"
  key_path = "${var.key_path}"
  aws_az1 = "${var.aws_az1}"
  aws_az2 = "${var.aws_az2}"
}

module "aws_ubuntu_systems" {
  source = "./aws_ubuntu_systems"
  aws_region = "${var.aws_region}"
  owner = "${var.owner}-${var.project_name}"
  ubuntu_subnet_id_az1 = "${module.aws_vpc.private_subnet1_id}"
  ubuntu_subnet_id_az2 = "${module.aws_vpc.private_subnet2_id}"
  public_subnet1_cidr = "${module.aws_vpc.public_subnet1_cidr}"
  public_subnet2_cidr = "${module.aws_vpc.public_subnet2_cidr}"
  private_subnet1_cidr = "${module.aws_vpc.private_subnet1_cidr}"
  private_subnet2_cidr = "${module.aws_vpc.private_subnet2_cidr}"
  key_name = "${module.aws_vpc.key_name}"
  vpc_id =  "${module.aws_vpc.vpc_default_id}"
  AllowedIPs = "${var.AllowedIPs}"
}