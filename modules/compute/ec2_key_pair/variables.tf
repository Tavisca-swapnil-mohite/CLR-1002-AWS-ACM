
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "Whether to create an instance"
  type        = string
  default     = null
}

variable "new_key_pair" {
  description = "Whether to create an instance"
  type        = bool
  default     = false
}

variable "existing_key_pair" {
  description = "Whether to create an instance"
  type        = bool
  default     = false
}


variable "public_key" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = null
  sensitive   = true
}