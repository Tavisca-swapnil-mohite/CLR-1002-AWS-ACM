
variable "name" {
  description = "Name to be used on  sg stance created"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "Name to be used on  sg stance created"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}






