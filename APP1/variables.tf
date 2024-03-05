variable "common_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { Backup = "no",DataClassification = "internal", BusinessUnit = "travel.poc",Environment = "poc"}
}

variable "name" {
   type = string
      }

variable "cidr" {
  type = string
}

variable "azs" {
type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "resource_tags_vpc" {
  type        = map(string)
  default     = {}
}



