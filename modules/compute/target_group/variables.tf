variable "vpc_id_tg" {
  type        = string
  description = "VPC ID to associate with ALB-TG"
}

variable "deregistration_delay" {
  type        = number
  default     = 15
  description = "The amount of time to wait in seconds before changing the state of a deregistering target to unused"
}

variable "slow_start" {
  type        = number
  default     = null
  description = "The amount of time (30-900 seconds) until a healthy target receives its full share of requests from the load balancer. 0 to disable."
}

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "The destination for the health check request"
}

variable "health_check_port" {
  type        = string
  default     = "traffic-port"
  description = "The port to use for the healthcheck"
}

variable "health_check_protocol" {
  type        = string
  default     = null
  description = "The protocol to use for the healthcheck. If not specified, same as the traffic protocol"
}

variable "health_check_timeout" {
  type        = number
  default     = 10
  description = "The amount of time to wait in seconds before failing a health check request"
}

variable "health_check_healthy_threshold" {
  type        = number
  default     = 2
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}

variable "health_check_unhealthy_threshold" {
  type        = number
  default     = 2
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}

variable "health_check_interval" {
  type        = number
  default     = 15
  description = "The duration in seconds in between health checks"
}

variable "health_check_matcher" {
  type        = string
  default     = "200-399"
  description = "The HTTP response codes to indicate a healthy check"
}


variable "target_group_port" {
  type        = number
  default     = 80
  description = "The port for the default target group"
}

variable "target_group_protocol" {
  type        = string
  default     = "HTTP"
  description = "The protocol for the default target group HTTP or HTTPS"
}

variable "target_group_protocol_version" {
  type        = string
  default     = "HTTP1"
  description = "The protocol version for the default target group HTTP1 or HTTP2 or GRPC"
}

variable "target_group_name" {
  type        = string
  default     = ""
  description = "The name for the default target group"
}

variable "target_group_target_type" {
  type        = string
  default     = "ip"
  description = "The type (`instance`, `alb`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "stickiness" {
  type = object({
    cookie_duration = number
    enabled         = bool
  })
  description = "Target group sticky configuration"
  default     = null
}

variable "load_balancing_algorithm_type" {
  type        = string
  default     = "round_robin"
  description = "Determines how the load balancer selects targets when routing requests. Only applicable for Application Load Balancer Target Groups"
}
