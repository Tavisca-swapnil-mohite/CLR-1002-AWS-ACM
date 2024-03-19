variable "iam_user_in" {
    type = string
    description = "Name of the policy to be created"
}

variable "tags_in" {
    description = "List of tags to be attached to the role"
    type = map(string)
    validation {
        condition     = var.tags_in > 1
        error_message = "Role should have atleast 1 tag."
  }
}

variable "iam_policy_in" {
    type = string
    description = "Name of the IAM policy to be created"
}

variable "is_policy_in" {
    type        = bool
    description = "Indicator if the policy is to be created"
}

variable "aws_region_in" {
    type = string
    description = "Name of region where infra is to be created"
}

variable "env_in" {
    type = string
    description = "Value of environment where deployment is targeted"
}

