variable "project_name" {
  type = string
}

variable "stage" {
  description = "stage"
  type        = string
}

variable "availability_zones" {
  type = object({
    a = string
    b = string
    c = string
    d = string
  })
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "subnet_id" {
  description = "subnet id"
  type        = string
}
