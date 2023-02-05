provider "aws" {
  region = "ap-northeast-2"
}
variable "availability_zones" {
  description = "availability zones"
  type = object({
    a = string
    b = string
    c = string
    d = string
  })
  default = {
    a = "ap-northeast-2a"
    b = "ap-northeast-2b"
    c = "ap-northeast-2c"
    d = "ap-northeast-2d"
  }
}

# ========== VPC ========== #
module "vpc" {
  source = "../modules/vpc"
}
