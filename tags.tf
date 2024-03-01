variable "common_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { Backup = "no",DataClassification = "internal", BusinessUnit = "travel.poc",Environment = "poc"}
}

variable "additional_tags_vpc" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "rabbitmq-cluster"}
}
variable "additional_tags_ec2" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "terra-test",AdditionalTag = "xyz"}
}

variable "additional_tags_sg1" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "public",AdditionalTag = "jkjkj"}
}
variable "additional_tags_sg2" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { AppName = "private", AdditionalTag1 = "xyz", AdditionalTag2 ="Some value"}
}

