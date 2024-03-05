# security_group_module/main.tf

variable "name" {
  description = "The name of the security group"
}

variable "description" {
  description = "The description of the security group"
}

variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "tags" {
  description = "A map of tags to assign to the security group"
  type        = map(string)
  default     = {}
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "A list of egress rules for the security group"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}