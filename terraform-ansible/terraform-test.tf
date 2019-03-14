provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  count = 2
  ami = "ami-82f4dae7"
  key_name = "default"
  instance_type = "t2.micro"
  tags {
    Name = "terraform-example-${format("%02d", count.index+1)}"
    Role = "terraform-example"
  }
}

