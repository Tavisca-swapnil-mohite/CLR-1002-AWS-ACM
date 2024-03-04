
variable "name" {
  type = string
 }

variable "vpc_id" {
   type = string
      }

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "ingress_cidr_blocks" {
  type        = list(string)
 
}

variable "ingress_rules" {
  type        = list(string)
 
}

variable "egress_rules" {
  type        = list(string)
 
}













