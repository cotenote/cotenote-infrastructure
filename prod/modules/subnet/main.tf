resource "aws_subnet" "subnet_public_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone.a
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-subnet-public-a"
  }
}

resource "aws_subnet" "subnet_public_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.availability_zone.b
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-subnet-public-b"
  }
}

resource "aws_subnet" "subnet_private_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.availability_zone.a

  tags = {
    Name = "${var.project_name}-subnet-private-a"
  }
}

resource "aws_subnet" "subnet_private_b" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = var.availability_zone.b

  tags = {
    Name = "${var.project_name}-subnet-private-b"
  }
}
