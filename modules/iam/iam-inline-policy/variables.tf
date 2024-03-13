variable "policy_name_in" {
    type = list(string)
    description = "Name of the policy to be created"
}

variable "role_in" {
    description = "Name of the role to which policy has to be attached"
}