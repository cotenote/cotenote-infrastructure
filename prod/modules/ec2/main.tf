resource "aws_instance" "api_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "prod-cotenote-api-ec2-key-pair"
  vpc_security_group_ids = [var.security_group_id.api_ec2]
  availability_zone      = var.availability_zone.a
  subnet_id              = var.subnet_id.public_a
  user_data              = file("modules/ec2/user_datas/api_ec2.sh")

  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "${var.stage}-${var.project_name}-api-ec2"
  }
}
