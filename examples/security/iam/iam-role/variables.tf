variable "iam_role_in" {
    type = string
    description = "Name of the role to be created"
}

variable "role_tags" {
    description = "Tags to be applied"
}

variable "aws_region_in" {
    type = string
    description = "Name of region where infra is to be created"
}

variable "env_in" {
    type = string
    description = "Value of environment where deployment is targeted"
}

