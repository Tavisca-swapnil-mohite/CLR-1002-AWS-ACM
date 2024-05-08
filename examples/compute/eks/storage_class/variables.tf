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