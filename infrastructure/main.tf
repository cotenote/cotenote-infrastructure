provider "aws" {
  region = "ap-northeast-2"
}

# ========== VPC ========== #
module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
}
