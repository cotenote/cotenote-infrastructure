resource "aws_security_group" "api_ec2_security_group" {
  name        = "${var.stage} ${var.project_name} api ec2"
  description = "${var.stage} ${var.project_name} api ec2"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow home SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.home_ip]
  }
  ingress {
    description = "Allow all HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.stage}-${var.project_name}-api-ec2-security-group"
  }
}


