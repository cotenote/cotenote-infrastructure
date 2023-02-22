variable "project_name" {
  type = string
}

variable "stage" {
  type = string
}

variable "security_group_id" {
  type = object({
    api_ec2 = string
    rds     = string
  })
}

variable "subnet_id" {
  type = object({
    public_a  = string
    public_b  = string
    private_a = string
    private_b = string
  })
}
