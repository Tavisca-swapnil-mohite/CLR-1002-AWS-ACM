
variable "timeouts" {
  description = "Define maximum timeout for creating, updating, and deleting EC2 instance resources"
  type        = map(string)
  default     = {}
}



variable "ebs_volume_size_list" {
  description = "The size of the EBS volume in GiB"
  type        = list(number)
  default     = null
}

variable "device_name_list" {
  description = "The size of the EBS volume in GiB"
  type        = list(string)
  default    = null
}

variable "instance_id_list" {
  description = "The size of the EBS volume in GiB"
  type        = list(string)
  default    = null
}

variable "ebs_volume_count" {
  description = " count of ebs volumes"
  type        = number
  default     = null
}


variable "tags" {
  description = "The tags of the EBS volume"
  type        = map(string)
  default     = {}
} 


variable "ebs_availability_zone" {
  description = "The availability zone in which to create the EBS volume"
  type        = string
  default     = null
}




variable "encrypted" {
  description = "wheather encryption enable or not"
  type        = bool
  default     = false
}

variable "final_snapshot" {
  description = "wheather volume backup before delete  enable or not"
  type        = bool
  default     = false
}

variable "snapshot_id" {
  description = "The id of volume base"
  type        = number
  default     = null
}

variable "multi_attach_enabled" {
  description = "wheather multiple attachment enable or not"
  type        = bool
  default     = false
}


variable "iops" {
  description = "ebs iops"
  type        = string
  default     = null
}