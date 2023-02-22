resource "aws_instance" "api_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "prod-cotenote-api-ec2-key-pair"
  vpc_security_group_ids = var.vpc_security_group_ids
  availability_zone      = var.availability_zones.a
  subnet_id              = var.subnet_id
  user_data              = file("modules/ec2/user_data/api_ec2.sh")

  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "${var.stage}-${var.project_name}-api-ec2"
  }
}
