variable "availability_zones" {
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

variable "project_name" {
  type    = string
  default = "cotenote"
}

variable "stage" {
  type = object({
    prod = string
    dev  = string
  })
  default = {
    prod = "prod"
    dev  = "dev"
  }
}
