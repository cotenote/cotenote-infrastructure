output "id" {
  value = {
    api_ec2 = aws_instance.api_ec2.id
  }
}
