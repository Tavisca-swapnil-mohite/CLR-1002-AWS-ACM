variable "tags" {
  description = "The tags of the EBS volume"
  type        = map(string)
  default     = {}
} 

variable "iops" {
  description = "The iops of the EBS volume"
  type        = string
}



variable "volume_size" {
  description = "The size of the EBS volume in GiB"
  type        = number
}

variable "availability_zone" {
  description = "The availability zone in which to create the EBS volume"
  type        = string
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

variable "instance_id" {
  description = "instance id"
  type        = string
  default     = null
}

variable "volume_id" {
  description = "volume id of ebs volume"
  type        = string
  default     = null
}

variable "device_name" {
  description = " volume attachment path to ec2 as device name"
  type        = string
  default     = null
}
