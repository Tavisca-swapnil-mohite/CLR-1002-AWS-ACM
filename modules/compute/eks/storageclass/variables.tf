#variable "tags" {
#  description = "A mapping of tags to assign to the resource"
#  type        = map(string)
#  default     = {}
#}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    AppName            = "eks-travel-stage-ns-issue-replica"
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = "eks-travel-stage-ns-issue-replica"
    Product            = "plt"
  }
}


variable "kmskeyid" {
  description = "Name of KMS key ID"
  type        = string
  default     = null
}

variable "BusinessUnit" {
  description = "Name of BusinessUnit"
  type        = string
  default     = null
}

variable "Environment" {
  description = "name of Environment"
  type        = string
  default     = null
}

variable "Name" {
  description = "Name of EKS cluster"
  type        = string
  default     = null
}