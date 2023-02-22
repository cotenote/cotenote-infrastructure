module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
}

module "subnet" {
  source            = "./modules/subnet"
  project_name      = var.project_name
  vpc_id            = module.vpc.id
  availability_zone = var.availability_zone
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
  subnet_id           = module.subnet.id
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
  source            = "./modules/ec2"
  project_name      = var.project_name
  stage             = var.stage
  availability_zone = var.availability_zone
  security_group_id = module.security_group.id
  subnet_id         = module.subnet.id
}

module "elastic_ip" {
  source      = "./modules/elastic_ip"
  instance_id = module.ec2.id
}
