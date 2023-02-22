output "id" {
  value = {
    api_ec2 = aws_security_group.api_ec2_security_group.id
    rds     = aws_security_group.rds_security_group.id
  }
}
