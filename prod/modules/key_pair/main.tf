resource "aws_key_pair" "prod-cotenote-api-ec2-key-pair" {
  key_name   = "prod-cotenote-api-ec2-key-pair"
  public_key = file("~/.ssh/prod-cotenote-api-ec2-key-pair.pub")
}
