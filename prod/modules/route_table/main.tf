resource "aws_route_table" "route_table_public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "${var.project_name}-route-table-public"
  }
}
resource "aws_route_table_association" "route_table_association_public_a" {
  subnet_id      = var.subnet_id.public_a
  route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "route_table_association_public_b" {
  subnet_id      = var.subnet_id.public_b
  route_table_id = aws_route_table.route_table_public.id
}
