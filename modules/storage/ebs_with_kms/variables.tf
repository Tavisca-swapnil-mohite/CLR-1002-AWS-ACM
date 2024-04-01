

variable "default_kms_key" {
  description = "enable custom key"
  type        = bool
  default     = false
}

variable "custom_kms_key" {
  description = "enable custom key"
  type        = bool
  default     = false
}
variable "enable_key_rotation" {

  type        = bool
  default     = false
}


variable "tags" {
  description = "The tags of the EBS volume"
  type        = map(string)
  default     = {}
} 

variable "iops" {
  description = "The iops of the EBS volume"
  type        = string
  default      = "3000"
}

variable "ebs_type" {
  description = "The type of the EBS volume"
  type        = string
  default    = "gp3"
} 


variable "volume_size" {
  description = "The size of the EBS volume in GiB"
  type        = number
  default     = 5
}

variable "availability_zone" {
  description = "The availability zone in which to create the EBS volume"
  type        = string
  default     = "us-east-1a"
}



variable "kms_key_id" {

  type        = string
  default     = "arn:aws:kms:us-east-1:796936741154:key/bbb032cb-ce86-404f-b2ee-1c232812a489"
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
