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
  description = "A mapping of tags to assign to the resource"
  type        = string
}

variable "kms_delete_after_days" {
    description = " The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key.it must be between 7 and 30, inclusive"
    type = number
}

variable "key_policy_map" {
    description = "A valid policy JSON document"
    type = any
}