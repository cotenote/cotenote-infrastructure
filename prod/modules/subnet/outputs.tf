output "id" {
  value = {
    public_a  = aws_subnet.subnet_public_a.id
    public_b  = aws_subnet.subnet_public_b.id
    private_a = aws_subnet.subnet_private_a.id
    private_b = aws_subnet.subnet_private_b.id
  }
}
