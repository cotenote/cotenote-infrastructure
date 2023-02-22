# ========== VPC ========== #
module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
}

# ========== Subnet ========== #
module "subnet" {
  source             = "../modules/subnet"
  project_name       = var.project_name
  vpc_id             = module.vpc.id
  availability_zones = var.availability_zones
}

# ========== Internet Gateway ========== #
module "internet_gateway" {
  source       = "../modules/internet_gateway"
  project_name = var.project_name
  vpc_id       = module.vpc.id
}

# ========== Route Table ========== #
module "route_table" {
  source              = "../modules/route_table"
  project_name        = var.project_name
  vpc_id              = module.vpc.id
  internet_gateway_id = module.internet_gateway.id
  subnet_public_a_id  = module.subnet.public_a_id
  subnet_public_b_id  = module.subnet.public_b_id
}

# ========== Security Group ========== #
module "security_group" {
  source       = "../modules/security_group"
  project_name = var.project_name
  stage        = var.stage.prod
  vpc_id       = module.vpc.id
}
