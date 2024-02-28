
variable "mandate_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "additional_tags_1" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { "AppName": "terra-test","Backup" : "no"," Environment" : "qa" , "BusinessUnit" : "travel.qa"}
}

variable "additional_tags_2" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


variable "additional_tags_3" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = { }
}

