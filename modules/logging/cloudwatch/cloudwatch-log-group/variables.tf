variable "name" {
    type = string
    description = "The name of the log group."
}

variable "name_prefix" {
    type = string
    default = null
    description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
}

variable "skip_destroy" {
    type = bool
    default = false
    description = "Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state."
}

variable "log_group_class" {
    type = string
    default = "STANDARD"
    description = "Specified the log class of the log group. Possible values are: STANDARD or INFREQUENT_ACCESS"
}

variable "retention_in_days" {
    type = number
    description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire."
    default = 30
    validation {
        condition     = contains([1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, 0], var.retention_in_days)
        error_message = "Valid values for var: retention_in_days are (1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0)."
    }
}

variable "kms_key_id" {
    type = string
    description = "The ARN of the KMS Key to use when encrypting log data."
    default = null
}