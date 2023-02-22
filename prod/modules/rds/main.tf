resource "aws_db_instance" "rds" {
  engine                = "mysql"
  engine_version        = "8.0.28"
  parameter_group_name  = aws_db_parameter_group.rds_parameter_group.name
  instance_class        = "db.t2.micro"
  allocated_storage     = 20
  max_allocated_storage = 100

  identifier = var.rds_env.identifier
  db_name    = var.rds_env.db_name
  username   = var.rds_env.username
  password   = var.rds_env.password

  publicly_accessible = true

  skip_final_snapshot = true

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.security_group_id.rds]

  tags = {
    Name = "${var.stage}-${var.project_name}-rds"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "${var.stage}-${var.project_name}-rds-subnet-group"
  #   subnet_ids = [var.subnet_id.private_a, var.subnet_id.private_b]
  subnet_ids = [var.subnet_id.public_a, var.subnet_id.public_b]
}

resource "aws_db_parameter_group" "rds_parameter_group" {
  name   = "${var.stage}-${var.project_name}-rds-parameter-group"
  family = "mysql8.0"

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_filesystem"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_results"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_connection"
    value = "utf8mb4_unicode_ci"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }
}
