variable "project_name" {
  type = string
}

variable "stage" {
  type = string
}

variable "availability_zone" {
  type = object({
    a = string
    b = string
    c = string
    d = string
  })
}

variable "security_group_id" {
  type = object({
    api_ec2 = string
  })
}

variable "subnet_id" {
  type = object({
    public_a = string
    public_b = string
  })
}
