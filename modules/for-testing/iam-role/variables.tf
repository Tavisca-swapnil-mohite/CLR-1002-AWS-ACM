variable "name" {
    type = string
}
variable "name_prefix" {
    type = string
    default = ""
}
variable "assume_role_policy" {
    type = string
    default = ""
}
variable "description" {
    type = string
    default = ""
}
variable "path" {
    type = string
    default = "/"
}
variable "force_detach_policies" {
    type = bool
    default = false
}
variable "inline_policy" {
    type = list(object({
        name = string
        policy = string
    }))
}
variable "managed_policy_arns" {
    type = list(string)
    default = []
}
variable "max_session_duration" {
    type = number
    default = 3600 #1hr
}
variable "permissions_boundary" {
    type = string
    description = "ARN of the policy that is used to set the permissions boundary for the role."
    default = ""
}