variable "common_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { Backup = "no",DataClassification = "internal", BusinessUnit = "travel.qa"}
}

variable "additional_tags_vpc" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "rabbitmq-cluster", Backup = "no",DataClassification = "internal", BusinessUnit = "travel.qa"}
}
variable "additional_tags_ec2" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "rabbitmq-cluster", Backup = "no",DataClassification = "internal", BusinessUnit = "travel.qa"}
}

variable "additional_tags_sg1" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "public", Backup = "no",DataClassification = "internal", BusinessUnit = "travel.qa"}
}
variable "additional_tags_sg2" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "private", Backup = "no",DataClassification = "internal", BusinessUnit = "travel.qa"}
}

