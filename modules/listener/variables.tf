variable "listener_port" {
  description = "The port on which the listener listens for requests"
  type        = number
}

variable "listener_protocol" {
  description = "The protocol for routing traffic to the targets"
  type        = string
}

variable "default_action_type" {
  description = "Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
  type        = string
}

variable "target_group_arn" {
  description = "Value of Target group ARN"
  type        = string
}

variable "load_balancer_arn" {
  description = "Value of load balancer ARN"
  type        = string
}
