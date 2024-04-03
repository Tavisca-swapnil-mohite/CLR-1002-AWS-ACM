variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

variable "target_type" {
  description = "The type of target `instance`, `ip`, `lambda`, `alb`"
  type        = string
}

variable "target_group_port" {
  description = "The port on which targets receive traffic, between 1 and 65535. Required when `target_type` is `instance`, `ip` or `alb`. Does not apply when `target_type` is `lambda`"
  type        = number
}

variable "target_group_protocol" {
  description = "The protocol to use for routing traffic to the targets. Protocol to use for routing traffic to the targets. Should be one of `GENEVE`, `HTTP`, `HTTPS`, `TCP`, `TCP_UDP`, `TLS`, or `UDP`. Required when `target_type` is `instance`, `ip`, or `alb`. Does not apply when `target_type` is `lambda`"
  type        = string
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group"
  type        = string
}

variable "health_check_path" {
  description = <<EOF
The destination for the health check request.  Destination for the health check request.
Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS.
For HTTP and HTTPS health checks, the default is `/`. 
For gRPC health checks, the default is `/Amazon Web Services.ALB/healthcheck`.
EOF
  type        = string
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
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target.The range is 5-300. For lambda target groups, it needs to be greater than the timeout of the underlying lambda. Defaults to 30."
  type        = number
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check.The range is 2–120 seconds. For target groups with a protocol of HTTP, the default is 6 seconds. For target groups with a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target groups with a protocol of GENEVE, the default is 5 seconds. If the target type is lambda, the default is 30 seconds."
  type        = number
}

variable "health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy. The range is 2-10. Defaults to 3."
  type        = number
}

variable "health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy. The range is 2-10. Defaults to `3`."
  type        = number
}

variable "target_ids" {
  description = "Enter a list of instance ids that you want to register as targets."
  type        = list(string)
}

variable "target_port" {
  description = "The port on which targets receive traffic."
  type        = number
}
