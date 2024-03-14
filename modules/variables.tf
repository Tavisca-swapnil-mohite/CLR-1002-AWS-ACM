variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen."
  type        = string
  default     = "test-lb"
}

variable "internal" {
  description = "If true, the ALB will be internal"
  type        = bool
  default     = true
}

variable "subnets" {
  description = "A list of subnet IDs to attach the ALB to"
  type        = list(string)
  default     = ["subnet-060048463710e54c4", "subnet-01d4d19deaa34db85"]
}

variable "security_groups" {
  description = "A list of security group IDs to attach to the ALB"
  type        = list(string)
  default     = ["sg-076ec17141de6c2fd"]
}

variable "enable_deletion_protection" {
  description = "If true, deletion protection will be enabled for the ALB"
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled. For network and gateway type load balancers, this feature is disabled by default (false). For application load balancer this feature is always enabled (true) and cannot be disabled. Defaults to false."
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment name (e.g., poc, qa, stage, prod)"
  type        = string
  default     = "poc"
}
variable "appName" {
  description = "The App name (e.g., Terraform )"
  type        = string
  default     = "test-lb"
}
variable "infraOwner" {
  description = "The Infra Owner (e.g., sre-cloud-reliability@tavisca.com )"
  type        = string
  default     = "sre-cloud-reliability@tavisca.com"
}
variable "businessUnit" {
  description = "The environment name (e.g., travel.poc)"
  type        = string
  default     = "travel.poc"
}
variable "backup" {
  description = "Backup required (e.g., yes or no)"
  type        = string
  default     = "no"
}
variable "dataClassification" {
  description = "Data classification (e.g., internal)"
  type        = string
  default     = "internal"
}
variable "product" {
  description = "The product name (e.g., poap )"
  type        = string
  default     = "poap"
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
  default     = "test-tg"
}

variable "target_type" {
  description = "The type of target `instance`, `ip`, `lambda`, `alb`"
  type        = string
  default     = "instance"
}

variable "target_group_port" {
  description = "The port on which targets receive traffic, between 1 and 65535. Required when `target_type` is `instance`, `ip` or `alb`. Does not apply when `target_type` is `lambda`"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "The protocol to use for routing traffic to the targets. Protocol to use for routing traffic to the targets. Should be one of `GENEVE`, `HTTP`, `HTTPS`, `TCP`, `TCP_UDP`, `TLS`, or `UDP`. Required when `target_type` is `instance`, `ip`, or `alb`. Does not apply when `target_type` is `lambda`"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group"
  type        = string
  default     = "vpc-07b12bcec12a4cd9b"
}

variable "health_check_path" {
  description = <<EOF
The destination for the health check request.  Destination for the health check request.
Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS.
For HTTP and HTTPS health checks, the default is `/`. 
For gRPC health checks, the default is `/Amazon Web Services.ALB/healthcheck`.
EOF
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = <<EOF
The port the load balancer uses when performing health checks on targets. 
Valid values are either `traffic-port`, to use the same port as the target group, or a valid port number between `1` and `65536`. 
Default is `traffic-port`.
EOF
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = <<EOF
Protocol the load balancer uses when performing health checks on targets. 
Must be one of `TCP`, `HTTP`, or `HTTPS`. 
The TCP protocol is not supported for health checks if the protocol of the target group is `HTTP` or `HTTPS`. 
Default is `HTTP`. Cannot be specified when the target_type is lambda.
EOF
  type        = string
  default     = "HTTP"
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target.The range is 5-300. For lambda target groups, it needs to be greater than the timeout of the underlying lambda. Defaults to 30."
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check.The range is 2–120 seconds. For target groups with a protocol of HTTP, the default is 6 seconds. For target groups with a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target groups with a protocol of GENEVE, the default is 5 seconds. If the target type is lambda, the default is 30 seconds."
  type        = number
  default     = 6
}

variable "health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy. The range is 2-10. Defaults to 3."
  type        = number
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy. The range is 2-10. Defaults to `3`."
  type        = number
  default     = 3
}
variable "listener_port" {
  description = "The port on which the listener listens for requests"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "The protocol for routing traffic to the targets"
  type        = string
  default     = "HTTP"
}

variable "default_action_type" {
  description = "Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
  type        = string
  default     = "forward"
}

variable "target_ids" {
  description = "Enter a list of instance ids that you want to register as targets."
  type        = list(string)
  default     = ["i-00078d155d6fd4815", "i-0be541e5091950c37"]
}

variable "target_port" {
  description = "The port on which targets receive traffic."
  type        = number
  default     = 80
}

