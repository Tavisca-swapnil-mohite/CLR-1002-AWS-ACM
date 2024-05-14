variable "policy_name" {
    type = string
    description = "Name of the resource policy."
}

variable "policy_document" {
    description = "Details of the resource policy, including the identity of the principal that is enabled to put logs to this account."
}