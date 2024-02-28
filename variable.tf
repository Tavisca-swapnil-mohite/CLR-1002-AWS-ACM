variable "prname" {
type= string
}

variable "ec2_name" {
type= string
default = "new2"
}

variable "ami" {
type= string
default = "ami-0a3c3a20c09d6f377"

}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default = "t2.micro"
}

/*
variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}
*/