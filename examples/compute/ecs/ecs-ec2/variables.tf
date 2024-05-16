## Cluster variables

variable "cluster_name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = ""
}

variable "service_name" {
  description = "Name of the service (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = ""
}

variable "default_capacity_provider_use_fargate" {
  description = "Determines whether to use Fargate or autoscaling for default capacity provider strategy"
  type        = bool
  default     = true
}

variable "autoscaling_capacity_providers" {
  description = "Map of autoscaling capacity provider definitions to create for the cluster"
  type        = any
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

## Service variables
variable "requires_compatibilities" {
  description = "Set of launch types required by the task. The valid values are `EC2` and `FARGATE`"
  type        = list(string)
}

variable "volume" {
  description = "Configuration block for volumes that containers in your task may use"
  type        = any
  default     = {}
}

variable "service_subnet_ids" {
  description = "List of subnets to associate with the task or service"
  type        = list(string)
  default     = []
}

## Container Definition 
variable "container_name" {
  description = "Name of the container (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = ""
}

variable "container_port" {
  description = "Port of the container"
  type        = number
  default     = null
}

variable "memory" {
  description = "The amount (in MiB) of memory to present to the container. If your container attempts to exceed the memory specified here, the container is killed. The total amount of memory reserved for all containers within a task must be lower than the task `memory` value, if one is specified"
  type        = number
  default     = null
}

variable "container_definitions" {
  description = "A map of valid [container definitions](http://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html). Please note that you should only provide values that are part of the container definition document"
  type        = any
  default     = {}
}

## Supporting variables
variable "alb_subnets" {
  description = "List of subnets to associate with the alb"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "The VPC id where the alb should be created"
  type        = string
  default     = ""
}

variable "vpc_cidr_block" {
  description = "The VPC CIDR to be allowed in the alb sg"
  type        = string
  default     = ""
}

