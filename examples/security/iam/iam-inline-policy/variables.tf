variable "policy_name_in" {
    type = list(string)
    description = "Name of the policy to be created"
}

variable "role_in" {
    description = "Name of the role to which policy has to be attached"
}

variable "aws_region_in" {
    type = string
    description = "Name of region where infra is to be created"
}

variable "env_in" {
    type = string
    description = "Value of environment where deployment is targeted"
}

