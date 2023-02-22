variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "subnet_id" {
  type = object({
    public_a = string
    public_b = string
  })
}
