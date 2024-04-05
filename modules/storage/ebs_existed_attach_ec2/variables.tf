
variable "instance_id" {
  description = "instance id to connect to ebs"
  type        = string
  default     = null
}

variable "volume_id" {
  description = " ebs volume id "
  type        = string
  default     = null
}

variable "device_name" {
  description = " device path name to attach ebs volume"
  type        = string
  default     = null
}