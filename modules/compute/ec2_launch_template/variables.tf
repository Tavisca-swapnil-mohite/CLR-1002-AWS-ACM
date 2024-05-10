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
  default = "Golden-AMI-EC2-Amazon2-imdsv2:4"
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

variable "elastic_gpu_type" {
  type = string
  default = null
  description = "The elastic GPU Type to attach to the instance."
}

variable "elastic_inference_accelerator_type" {
  type = string
  default = null
  description = "Elastic Inference Accelerator Type to attach to the instance."
}

variable "enable_nitro_enclaves" {
  type = bool
  default = false
  description = "If set to true, Nitro Enclaves will be enabled on the instance."
}

variable "enable_hibernation" {
  type = bool
  default = false
  description = "If set to true, the launched EC2 instance will hibernation enabled."
}

variable "instance_initiated_shutdown_behavior" {
  type = string
  default = null
  description = "Shutdown behavior for the instance. Can be stop or terminate. (Default: stop)."
}

variable "kernel_id" {
  type = string
  default = null
  description = "The kernel ID."
}

variable "userdata" {
  type = string
  description = "Userdata for the Instances. Expects userdata in base64 encoded form."
}

variable "metadata_http_put_response_hop_limit" {
  type = number
  default = 1
}

variable "instance_metadata_tags" {
  type = string
  default = null
}

variable "capacity_reservation_specification" {
  type = map(any)
  default = null
}

variable "cpu_options" {
  type = map(string)
  default = null
}

variable "credit_specification_cpu_credits" {
  type = string
  default = null
}

variable "license_configuration_arn" {
  type = string
  default = null
}

variable "monitoring" {
  type = bool
  default = null
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