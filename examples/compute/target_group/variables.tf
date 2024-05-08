variable "region" {
  type        = string
  description = "AWS Region for S3 bucket"
  default     = "us-east-1"
}

variable "vpc_id_tg" {
  type        = string
  description = "VPC ID to associate with ALB-TG"
}

variable "deregistration_delay" {
  type        = number
  description = "The amount of time to wait in seconds before changing the state of a deregistering target to unused"
}

variable "health_check_path" {
  type        = string
  description = "The destination for the health check request"
}

variable "health_check_timeout" {
  type        = number
  description = "The amount of time to wait in seconds before failing a health check request"
}

variable "health_check_healthy_threshold" {
  type        = number
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}

variable "health_check_unhealthy_threshold" {
  type        = number
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}

variable "health_check_interval" {
  type        = number
  description = "The duration in seconds in between health checks"
}

variable "health_check_matcher" {
  type        = string
  description = "The HTTP response codes to indicate a healthy check"
}

variable "target_group_port" {
  type        = number
  description = "The port for the default target group"
}

variable "target_group_target_type" {
  type        = string
  description = "The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "stickiness" {
  type = object({
    cookie_duration = number
    enabled         = bool
  })
  description = "Target group sticky configuration"
}

variable "target_group_protocol" {
  type        = string
  description = "The protocol for the default target group HTTP or HTTPS"
}

variable "target_group_protocol_version" {
  type        = string
  description = "The protocol version for the default target group HTTP1 or HTTP2 or GRPC"
}

variable "target_group_name" {
  type        = string
  description = "The name for the default target group"
}
