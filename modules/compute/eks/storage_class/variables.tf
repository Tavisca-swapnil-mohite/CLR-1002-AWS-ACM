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

variable "kms_alias" {
  description = "A mapping of tags to assign to the resource"
  type        = string
}

variable "delete_after_days" {
    description = " The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key.it must be between 7 and 30, inclusive"
    type = number
}

variable "key_description" {
    description = "The description of the key as visible in AWS console"
    type = string
}

variable "key_policy_statements" {
  description = "All the statements for the key policy"
  type = map(object({
    sid = string
    actions = list(string)
    resources = list(string)
    effect = string
    principals = object({
      identifiers = list(string)
    })
  }))
default = {}
}