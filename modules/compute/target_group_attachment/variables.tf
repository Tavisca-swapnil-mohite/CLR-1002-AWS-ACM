variable "target_id" {
  type        = string
  default     = "ip"
  description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the Lambda function ARN. If the target type is alb, specify the ALB ARN."
}

variable "target_group_target_type" {
  type        = string
  default     = "ip"
  description = "The type (`instance`, `alb`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "target_group_arn" {
  description = "Value of Target group ARN"
  type        = string
}

variable "target_port" {
  description = "The port on which targets receive traffic."
  type        = number
}
