variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "environment_tags" {
  type        = map(string)
  default     = {}
}

variable "resource_tags" {
  type        = map(string)
  default     = { }
}





variable "resource_tags_vpc" {
  type        = map(string)
  default     = {AppName = "rabbitmq-cluster"}
}


variable "resource_tags_ec2" {
  type        = map(string)
  default     = {AppName = "terra-test",AdditionalTag = "xyz"}
}

