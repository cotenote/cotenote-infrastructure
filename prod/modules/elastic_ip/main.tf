resource "aws_eip" "my_eip" {
  instance = var.instance_id.api_ec2
  vpc      = true
}
