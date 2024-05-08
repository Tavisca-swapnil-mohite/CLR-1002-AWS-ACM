variable "listener_name" {
  type        = string
  default     = ""
  description = "The name for the listener"
}

variable "listener_http_fixed_response" {
  description = "Have the HTTP listener return a fixed response for the default action."
  type = object({
    content_type = string
    message_body = string
    status_code  = string
  })
  default = null
}

variable "listener_https_fixed_response" {
  description = "Have the HTTPS listener return a fixed response for the default action."
  type = object({
    content_type = string
    message_body = string
    status_code  = string
  })
  default = null
}

variable "http_port" {
  type        = number
  default     = 80
  description = "The port for the HTTP listener"
}

variable "http_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable HTTP listener"
}

variable "http_redirect" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable HTTP redirect to HTTPS"
}

variable "certificate_arn" {
  type        = string
  default     = null
  description = "The ARN of the default SSL certificate for HTTPS listener"
}


variable "https_port" {
  type        = number
  default     = 443
  description = "The port for the HTTPS listener"
}

variable "https_enabled" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable HTTPS listener"
}


variable "https_ssl_policy" {
  type        = string
  description = "The name of the SSL Policy for the listener"
  default     = "ELBSecurityPolicy-2015-05"
}

variable "target_group_arn" {
  description = "Value of Target group ARN"
  type        = list(string)
}

variable "load_balancer_arn" {
  description = "Value of load balancer ARN"
  type        = string
}
