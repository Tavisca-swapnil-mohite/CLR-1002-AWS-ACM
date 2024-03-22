variable "service_name_in" {
    type = list(string)
    description = "Name of the services for which role is to be created"
}

variable "tags_in" {
    description = "List of tags to be attached to the role"
    type = map(string)
    validation {
        condition     = var.tags_in > 1 && var.tags_in['Product'] != null && var.tags_in['InfraOwner'] != null && var.tags_in['Environment'] != null && var.tags_in['AppName'] && != null && var.tags_in['Backup'] != null && var.tags_in['BusinessUnit'] != null && var.tags_in['DataClassification'] != null
        error_message = "Role should have atleast 1 tag."
  }
}

variable "aws_region_in" {
    type = string
    description = "Name of region where infra is to be created"
}

variable "env_in" {
    type = string
    description = "Value of environment where deployment is targeted"
}

