variable "region" {
  type        = string
  description = "AWS Region for S3 bucket"
  default     = "us-east-1"
}

variable "vpc_id_tg" {
  type        = string
  description = "VPC ID to associate with ALB-TG"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "internal" {
  type        = bool
  description = "A boolean flag to determine whether the ALB should be internal"
}

variable "http_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable HTTP listener"
}

variable "http_redirect" {
  type        = bool
  description = "A boolean flag to enable/disable HTTP redirect to HTTPS"
}

variable "cross_zone_load_balancing_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable cross zone load balancing"
}

variable "http2_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable HTTP/2"
}

variable "idle_timeout" {
  type        = number
  description = "The time in seconds that the connection is allowed to be idle"
}

variable "ip_address_type" {
  type        = string
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`."
}

variable "deletion_protection_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable deletion protection for ALB"
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

variable "name" {
  description = "The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen."
  type        = string
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of additional security group IDs to allow access to ALB"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs to associate with ALB"
}

variable "target_group_name" {
  type        = string
  default     = ""
  description = "The name for the default target group"
}

variable "listener_name" {
  type        = string
  default     = ""
  description = "The name for the listener"
}

variable "target_id" {
  type        = string
  default     = "ip"
  description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the Lambda function ARN. If the target type is alb, specify the ALB ARN."
}

variable "target_port" {
  description = "The port on which targets receive traffic."
  type        = number
}

variable "create_target_group" {
  type        = bool
  description = "Whether the default target group should be created or not. Enter true or false."
}

variable "target_group_arn" {
  type        = string
  description = "Enter the ARN of Target Group if you want to attach the existing one."
}

variable "target_group_protocol" {
  type        = string
  description = "The protocol for the default target group HTTP or HTTPS"
}

variable "target_group_protocol_version" {
  type        = string
  description = "The protocol version for the default target group HTTP1 or HTTP2 or GRPC"
}
