variable "project_name" {
  type = string
}

variable "vpc_id" {
  description = "vpc_id"
  type        = string
}

variable "internet_gateway_id" {
  description = "internet_gateway_id"
  type        = string
}

variable "subnet_public_a_id" {
  description = "subnet_public_a_id"
  type        = string
}

variable "subnet_public_b_id" {
  description = "subnet_public_b_id"
  type        = string
}
