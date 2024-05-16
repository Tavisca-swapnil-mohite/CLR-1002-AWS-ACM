variable "aws_region" {
    type = string
}

variable "instance_type" {
  type = string
}

variable "ebs_volume_details" {
  type = list(map(string))
  default = null
}

variable "instance_iam_role" {
  type = string
}

variable "ami_id_ssm_param_name" {
  type = string
  default = "Golden-AMI-EC2-Amazon2-imdsv2"
}

variable "key_name" {
  type = string
}

variable "vpc_subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "termination_protection" {
  type = bool
  default = false
}

variable "stop_protection" {
  type = bool
  default = false
}

variable "ebs_optimized" {
  type = bool
  default = false
  description = "If true, the launched EC2 instance will be EBS-optimized."
}

variable "metadata_http_put_response_hop_limit" {
  type = number
  default = 1
}

variable "instance_metadata_tags" {
  type = string
  default = null
}

###### Userdata vars
variable "chef_env_name" {
  type = string
}

variable "seednode_ssm_param_name" {
  type = string
}

variable "isprimary_ssm_param_name" {
  type = string
}


####################
variable "tag_product" {
  type = string
}

variable "tag_appname" {
  type = string
}

variable "tag_infraowner" {
  type = string
}

variable "tag_environment" {
  type = string
}

variable "tag_backup" {
  type = string
}

variable "tag_businessunit" {
  type = string
}

variable "tag_dataclassification" {
  type = string
}