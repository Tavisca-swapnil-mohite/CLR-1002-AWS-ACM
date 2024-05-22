variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = ""
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = list(string)
  default     = []
}

variable "zone_id" {
  description = "The ID of the hosted zone to contain this record."
  type        = string
  default     = ""
}

variable "ttl" {
  description = "The TTL of the record."
  type        = number
  default     = 60
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "validate_certificate" {
  description = "Whether or not certificate should be validated"
  type        = bool
  default     = true
}

variable "allow_overwrite_records" {
  description = "Allow creation of this record in Terraform to overwrite an existing record, if any."
  type        = bool
  default     = true
}

variable "private_zone" {
  description = "Whether the given hosted zone name is a private or public zone, true represents private. The default is false."
  type        = bool
  default     = false
}









variable "validation_method" {
description = "aauthorized to modify the DNS configuration for the domains in your certificate request"
type = string
default = ""

}


variable "key_algorithm" {
  description = "The key algorithm for the ACM certificate"
  type = string 
  default = ""
  
}
