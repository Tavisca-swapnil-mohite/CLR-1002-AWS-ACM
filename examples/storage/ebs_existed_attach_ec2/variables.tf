
variable "volume_id_attach_list" {
  description = "The size of the EBS volume in GiB"
  type        = list(string)
  default     = null
}

variable "device_name_attach_list" {
  description = "The size of the EBS volume in GiB"
  type        = list(string)
  default    = null
}

variable "instance_id_attach_list" {
  description = "The size of the EBS volume in GiB"
  type        = list(string)
  default    = null
}

variable "ebs_volume_attach_count" {
  description = " count of ebs volumes"
  type        = number
  default     = null
}