
## Cluster variables
variable "cluster_name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

## service variables
variable "service_subnet_ids" {
  description = "List of subnets to associate with the task or service"
  type        = list(string)
  default     = []
}

variable "enable_execute_command" {
  description = "Specifies whether to enable Amazon ECS Exec for the tasks within the service"
  type        = bool
  default     = false
}

## Container Definition 
variable "container_name" {
  description = "Name of the container (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = ""
}

variable "cpu" {
  description = "The number of cpu units to reserve for the container. This is optional for tasks using Fargate launch type and the total amount of `cpu` of all containers in a task will need to be lower than the task-level cpu value"
  type        = number
  default     = null
}

variable "memory" {
  description = "The amount (in MiB) of memory to present to the container. If your container attempts to exceed the memory specified here, the container is killed. The total amount of memory reserved for all containers within a task must be lower than the task `memory` value, if one is specified"
  type        = number
  default     = null
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