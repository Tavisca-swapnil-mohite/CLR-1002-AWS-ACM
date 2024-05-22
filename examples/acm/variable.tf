
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = list(string)
  default     = []
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = ""
}


variable "validation_method" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = ""

}


variable "key_algorithm" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = ""

}