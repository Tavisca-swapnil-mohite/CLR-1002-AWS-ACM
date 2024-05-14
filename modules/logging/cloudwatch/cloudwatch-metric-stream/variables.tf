variable "firehose_arn" {
    type = string
}

variable "role_arn" {
    type = string
}

variable "output_format" {
    type = string
    default = "json"
    validation {
        condition     = contains(["json", "opentelemetry0.7", "opentelemetry1.0"], var.output_format)
        error_message = "Valid values for var: output_format are (json, opentelemetry0.7, opentelemetry1.0)."
    }
}

variable "name" {
    type = string
    description = "Friendly name of the metric stream. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
    default = null
}

variable "name_prefix" {
    type = string
    description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with name."
    default = null
}

variable "exclude_filter" {
  description = "Map of exclusive metric filters. If you specify this parameter, the stream sends metrics from all metric namespaces except for the namespaces and the conditional metric names that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is excluded. Conflicts with include_filter."
  type        = any
  default     = {}
}

variable "include_filter" {
  description = "Map of inclusive metric filters. If you specify this parameter, the stream sends only the conditional metric names from the metric namespaces that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is included. Conflicts with exclude_filter."
  type        = any
  default     = {}
}

variable "statistics_configuration" {
  description = "Map of statistics configuration."
  type        = any
  default     = []
}