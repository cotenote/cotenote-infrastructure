module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
}

module "subnet" {
  source             = "./modules/subnet"
  project_name       = var.project_name
  vpc_id             = module.vpc.id
  availability_zones = var.availability_zones
}

module "internet_gateway" {
  source       = "./modules/internet_gateway"
  project_name = var.project_name
  vpc_id       = module.vpc.id
}

module "route_table" {
  source              = "./modules/route_table"
  project_name        = var.project_name
  vpc_id              = module.vpc.id
  internet_gateway_id = module.internet_gateway.id
  subnet_public_a_id  = module.subnet.public_a_id
  subnet_public_b_id  = module.subnet.public_b_id
}

module "security_group" {
  source       = "./modules/security_group"
  project_name = var.project_name
  stage        = var.stage
  vpc_id       = module.vpc.id
}

module "key_pair" {
  source = "./modules/key_pair"
}

module "ec2" {
  source                 = "./modules/ec2"
  project_name           = var.project_name
  stage                  = var.stage
  availability_zones     = var.availability_zones
  vpc_security_group_ids = [module.security_group.api_ec2_security_group_id]
  subnet_id              = module.subnet.public_a_id
}

module "elastic_ip" {
  source      = "./modules/elastic_ip"
  instance_id = module.ec2.id
}
