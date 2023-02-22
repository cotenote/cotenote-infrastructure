data "aws_instance" "api_ec2" {
  filter {
    name   = "tag:Name"
    values = ["${var.stage}-${var.project_name}-api-ec2"]
  }
}
