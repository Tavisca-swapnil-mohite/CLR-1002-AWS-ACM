variable "ami_id_ssm_param_name" {
  type = string
  default = "Golden-AMI-ECS-Amazon2"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "asg_name" {
  description = "Name of the autoscaling group (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = ""
}

variable "asg_subnet_ids" {
  description = "List of subnets to launch the asg"
  type        = list(string)
  default     = []
}

variable "asg_sec_grps" {
  description = "List of security groups to associate with the asg"
  type        = list(string)
  default     = []
}

variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
  type        = bool
  default     = false
}

variable "ignore_desired_capacity_changes" {
  description = "Determines whether the `desired_capacity` value is ignored after initial apply. See README note for more details"
  type        = bool
  default     = false
}
