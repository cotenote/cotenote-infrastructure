resource "aws_db_instance" "rds" {
  engine                = "mysql"
  engine_version        = "8.0.28"
  parameter_group_name  = "default.mysql8.0"
  instance_class        = "db.t2.micro"
  allocated_storage     = 20
  max_allocated_storage = 100

  identifier = var.rds_env.identifier
  db_name    = var.rds_env.db_name
  username   = var.rds_env.username
  password   = var.rds_env.password

  skip_final_snapshot = true

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.security_group_id.rds]

  tags = {
    Name = "${var.stage}-${var.project_name}-rds"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.stage}-${var.project_name}-rds-subnet-group"
  subnet_ids = [var.subnet_id.private_a, var.subnet_id.private_b]
}
