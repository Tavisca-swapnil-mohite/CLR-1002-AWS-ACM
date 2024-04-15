
variable "maintenance_options" {
  description = "The maintenance options for the instance"
  type        = any
  default     = {}
}

variable "name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = null
}

variable "ami_ssm_parameter" {
  description = "SSM parameter name for the AMI ID. For Amazon Linux AMI SSM parameters see [reference](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters-ami.html)"
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}


variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = null
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(any)
  default     = []
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}

variable "ephemeral_block_device" {
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
  type        = list(map(string))
  default     = []
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instance" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "instance_tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}


variable "metadata_options" {
  description = "Customize the metadata options of the instance"
  type        = map(string)
  default = {
    "http_endpoint"               = "enabled"
    "http_put_response_hop_limit" = 1
    "http_tokens"                 = "optional"
  }
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = null
}

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(map(string))
  default     = []
}

variable "private_dns_name_options" {
  description = "Customize the private DNS name options of the instance"
  type        = map(string)
  default     = {}
}




variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(any)
  default     = []
}



variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs"
  type        = bool
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set"
  type        = bool
  default     = null
}

variable "volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time"
  type        = map(string)
  default     = {}
}

variable "enable_volume_tags" {
  description = "Whether to enable volume tags (if enabled it conflicts with root_block_device tags)"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "timeouts" {
  description = "Define maximum timeout for creating, updating, and deleting EC2 instance resources"
  type        = map(string)
  default     = {}
}



variable "disable_api_stop" {
  description = "If true, enables EC2 Instance Stop Protection"
  type        = bool
  default     = null

}
