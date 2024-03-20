variable "policy_name_in" {
    type = string
    description = "Name of the policy to be created"
}

variable "tags_in" {
    description = "List of tags to be attached to the role"
    type = map(string)
    validation {
        condition     = var.tags_in > 1 && var.tags_in['Product'] != null && var.tags_in['InfraOwner'] != null && var.tags_in['Environment'] != null && var.tags_in['AppName'] && != null && var.tags_in['Backup'] != null && var.tags_in['BusinessUnit'] != null && var.tags_in['DataClassification'] != null
        error_message = "Role should have atleast 1 tag."
  }
}

variable "iam_role_in" {
    type = string
    description = "Name of the role to be attached to the policy"
}

variable "env_in" {
    type = string
    description = "Value of environment where deployment is targeted"
}

