
variable "name" {
   type = string
   default = "vpc"
      }

variable "cidr" {
  type = string
  default = "10.0.0.0/20"
}

variable "azs" {
type = list(string)
default = ["us-east-1a"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "public_subnets" {
  type = list(string)
   default = ["10.0.2.0/24"]
}

variable "tags" {
  type        = map(string)
  default     = {Backup = "no",DataClassification = "internal"}
}













