provider "aws" {
  region = var.aws_region
}

#Get the most recent AMI for F5
data "aws_ami" "f5_ami" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = [var.f5_name_filter]
  }
}


# Data resource to create the user_data script
data "template_file" "f5_bigip_onboard" {
  template = file("./templates/f5_onboard.tpl")

  vars = {
    DO_URL          = var.DO_URL
    AS3_URL		      = var.AS3_URL
    HA_URL          = var.HA_URL
    libs_dir		    = var.libs_dir
    onboard_log		  = var.onboard_log
  }
}

#NIC that will be assigned to BIG-IP1 
resource "aws_network_interface" "f5_bigip1_interface" {
  subnet_id         = var.f5_subnet1_id
  security_groups   = [aws_security_group.f5_bigip_sg.id]
  private_ips_count = "3"
}

#NIC that will be assigned to BIG-IP2
resource "aws_network_interface" "f5_bigip2_interface" {
  subnet_id         = var.f5_subnet2_id
  security_groups   = [aws_security_group.f5_bigip_sg.id]
  private_ips_count = "3"
}

#Elastic IP to access BIG-IP1 Mgmt interface
resource "aws_eip" "f5_bigip1_mgmt" {
  vpc               = true
  network_interface = aws_network_interface.f5_bigip1_interface.id

   depends_on       = ["aws_instance.f5_bigip1"]
}

#Elastic IP to access BIG-IP2 Mgmt interface
resource "aws_eip" "f5_bigip2_mgmt" {
  vpc               = true
  network_interface = aws_network_interface.f5_bigip2_interface.id

  depends_on        = ["aws_instance.f5_bigip2"]
}

#Elastic IP to access BIG-IP1 App interface
resource "aws_eip" "f5_bigip1_app" {
  vpc                       = true
  network_interface         = aws_network_interface.f5_bigip1_interface.id
  associate_with_private_ip = "${tolist(aws_network_interface.f5_bigip1_interface.private_ips)[1]}"

  depends_on                = ["aws_instance.f5_bigip1"]
}

#Deploy F5 BIG-IP1 1 Nic Standalone
resource "aws_instance" "f5_bigip1" {
  instance_type                 = var.f5_instance_type
  ami                           = data.aws_ami.f5_ami.id

  associate_public_ip_address   = true
  key_name                      = var.key_name
  network_interface {
    network_interface_id = aws_network_interface.f5_bigip1_interface.id
    device_index         = 0
  }

  root_block_device {
    delete_on_termination       = true
  }
  user_data                     = data.template_file.f5_bigip_onboard.rendered
  tags = {
    Name                        = "${var.owner}-f5_bigip1"
  }
}

#Deploy F5 BIG-IP2 1 Nic Standalone
resource "aws_instance" "f5_bigip2" {
  instance_type                 = var.f5_instance_type
  ami                           = data.aws_ami.f5_ami.id

  associate_public_ip_address   = true
  key_name                      = var.key_name
  network_interface {
    network_interface_id = aws_network_interface.f5_bigip2_interface.id
    device_index         = 0
  }

  root_block_device {
    delete_on_termination       = true
  }
  user_data                     = data.template_file.f5_bigip_onboard.rendered
  tags = {
    Name                        = "${var.owner}-f5_bigip2"
  }
}