resource "aws_security_group" "f5_bigip_sg_app" {
  name        = "${var.owner}-f5-sg-app"
  vpc_id      = var.vpc_id
  description = "${var.owner} F5 BIG-IP Security Group for Web Application"

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.AllowedIPs
  }

  # HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.AllowedIPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.owner}-f5-sg-app"
  }
}