variable "name" {
    type = string
    description = "A name for the metric filter."
}

variable "pattern" {
    type = string
    description = " A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events."
}

variable "log_group_name" {
    type = string
    description = "The name of the log group to associate the metric filter with."
}

variable "metric_transformation" {
    description = "A block defining collection of information needed to define how metric data gets emitted"
    type = object({
        name          = string
        namespace     = string
        value         = optional(string)
        default_value = optional(string)
        unit          = optional(string)
        dimensions    = optional(any)
    })
}