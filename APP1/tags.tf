variable "tags" {
  type        = map(string)
  default     = {}
}

variable "resource_tags" {
  type        = map(string)
  default     = {AppName = "rabbitmq-cluster"}
}

variable "resource_tags_vpc" {
  type        = map(string)
  default     = {AppName = "rabbitmq-cluster"}
}

variable "resource_tags_ec2" {
  type        = map(string)
  default     = {AppName = "rabbitmq-cluster"}
}

variable "resource_tags_sg1" {
  type        = map(string)
  default     = {AppName = "public"}
}
variable "resource_tags_sg2" {
  type        = map(string)
  default     = {AppName = "Private"}
}


variable "common_tags" {
  type        = map(string)
  default     = {Backup = "no",DataClassification = "internal"}
}