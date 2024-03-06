
 variable "common_tags" {
  type        = map(string)
  default     = {Backup = "no",DataClassification = "internal"}
}

variable "resource_tags" {
  type        = map(string)
  default     = {}
}

variable "resource_tags_vpc" {
  type        = map(string)
  default     = {AppName = "rabbitmq-cluster"}
}

variable "resource_tags_ec2" {
  type        = map(string)
  default     = {AppName = "terra-test",AdditionalTag = "xyz"}
}

variable "resource_tags_sg1" {
  type        = map(string)
  default     = {AppName = "public",AdditionalTag = "jkjkj"}
}
variable "resource_tags_sg2" {
  type        = map(string)
  default     = {AppName = "private",AdditionalTag1 = "xyz",AdditionalTag2 ="Some value"}

   
}


