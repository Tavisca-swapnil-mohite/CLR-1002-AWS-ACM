variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    AppName            = null
    Backup             = null
    BusinessUnit       = null
    DataClassification = null
    Environment        = null
    InfraOwner         = null
    Name               = null
    Product            = null
  }
}

variable "kmskeyid" {
  description = "Name of KMS key ID"
  type        = string
  default     = null
}

variable "BusinessUnit" {
  description = "Name of BusinessUnit"
  type        = string
  default     = null
}

variable "Environment" {
  description = "name of Environment"
  type        = string
  default     = null
}

variable "Name" {
  description = "Name of EKS cluster"
  type        = string
  default     = null
}

variable "AppName" {
  description = "Name of App name"
  type        = string
  default     = null
}

variable "DataClassification" {
  description = "Name of DataClassification"
  type        = string
  default     = null
}

variable "InfraOwner" {
  description = "Name of InfraOwner"
  type        = string
  default     = null
}

variable "Product" {
  description = "Name of Product"
  type        = string
  default     = null
}

variable "Backup" {
  description = "backup required"
  type        = string
  default     = null
}

variable "kms_delete_after_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key.it must be between 7 and 30, inclusive"
  type        = number
  default     = 30
}

variable "key_policy_map" {
  description = "A valid policy JSON document"
  type        = any
  default     = null
}