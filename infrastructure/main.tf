provider "aws" {
  region = "ap-northeast-2"
}

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
