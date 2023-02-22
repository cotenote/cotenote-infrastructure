variable "project_name" {
  type = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "availability_zone" {
  description = "availability zones"
  type = object({
    a = string
    b = string
    c = string
    d = string
  })
}
