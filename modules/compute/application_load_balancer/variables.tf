variable "name" {
  description = "The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen."
  type        = string
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs to associate with ALB"
}

variable "access_logs" {
  description = "Configuration for access logs."
  type        = map(string)
  default = {
    bucket  = ""
    prefix  = ""
    enabled = false
  }
}

variable "connection_logs" {
  description = "Configuration for connection logs."
  type        = map(string)
  default = {
    bucket  = ""
    prefix  = ""
    enabled = false
  }
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of additional security group IDs to allow access to ALB"
}

variable "internal" {
  type        = bool
  default     = true
  description = "A boolean flag to determine whether the ALB should be internal"
}

variable "cross_zone_load_balancing_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable cross zone load balancing"
}

variable "http2_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable HTTP/2"
}

variable "idle_timeout" {
  type        = number
  default     = 60
  description = "The time in seconds that the connection is allowed to be idle"
}

variable "ip_address_type" {
  type        = string
  default     = "ipv4"
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`."
}

variable "deletion_protection_enabled" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable deletion protection for ALB"
}

variable "drop_invalid_header_fields" {
  type        = bool
  default     = false
  description = "Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false)."
}

variable "preserve_host_header" {
  type        = bool
  default     = false
  description = "Indicates whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change."
}

variable "xff_header_processing_mode" {
  type        = string
  default     = "append"
  description = "Determines how the load balancer modifies the X-Forwarded-For header in the HTTP request before sending the request to the target. The possible values are append, preserve, and remove. Only valid for Load Balancers of type application. The default is append"
}

variable "client_keep_alive" {
  type        = number
  default     = 3600
  description = "Client keep alive value in seconds. The valid range is 60-604800 seconds."
}

variable "desync_mitigation_mode" {
  description = "Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync. Valid values are `monitor`, `defensive` (default), `strictest`"
  type        = string
  default     = "defensive"
}

variable "enable_tls_version_and_cipher_suite_headers" {
  description = "Indicates whether the two headers (`x-amzn-tls-version` and `x-amzn-tls-cipher-suite`), which contain information about the negotiated TLS version and cipher suite, are added to the client request before sending it to the target. Only valid for Load Balancers of type `application`. Defaults to `false`"
  type        = bool
  default     = false
}

variable "enable_xff_client_port" {
  description = "Indicates whether the X-Forwarded-For header should preserve the source port that the client used to connect to the load balancer in `application` load balancers. Defaults to `false`"
  type        = bool
  default     = false
}

variable "enable_waf_fail_open" {
  description = "Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF. Defaults to `false`"
  type        = bool
  default     = false
}

variable "subnet_mapping" {
  description = "A list of subnet mapping blocks describing subnets to attach to load balancer"
  type        = list(map(string))
  default     = []
}

variable "environment" {
  description = "The environment name (e.g., poc, qa, stage, prod)"
  type        = string
}
variable "appName" {
  description = "The App name (e.g., Terraform )"
  type        = string
}
variable "infraOwner" {
  description = "The Infra Owner (e.g., sre-cloud-reliability@tavisca.com )"
  type        = string
}
variable "businessUnit" {
  description = "The environment name (e.g., travel.poc)"
  type        = string
}
variable "backup" {
  description = "Backup required (e.g., yes or no)"
  type        = string
}
variable "dataClassification" {
  description = "Data classification (e.g., internal)"
  type        = string
}
variable "product" {
  description = "The product name (e.g., poap )"
  type        = string
}
