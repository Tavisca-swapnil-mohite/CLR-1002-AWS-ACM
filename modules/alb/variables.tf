variable "name" {
  description = "The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen."
  type        = string
}

variable "internal" {
  description = "If true, the ALB will be internal"
  type        = bool
}

variable "subnets" {
  description = "A list of subnet IDs to attach the ALB to"
  type        = list(string)
}

variable "security_groups" {
  description = "A list of security group IDs to attach to the ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "If true, deletion protection will be enabled for the ALB"
  type        = bool
}

variable "enable_cross_zone_load_balancing" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled. For network and gateway type load balancers, this feature is disabled by default (false). For application load balancer this feature is always enabled (true) and cannot be disabled. Defaults to false."
  type        = bool
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
