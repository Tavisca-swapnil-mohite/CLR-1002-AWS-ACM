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
  description = "A mapping of tags to assign to the resource"
  type        = string
  default     = "alias/eks-ebs-encrypt-key"
}