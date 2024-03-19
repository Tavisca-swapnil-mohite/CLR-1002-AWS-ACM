
variable "create_dlq" {
  description = "Determines whether to create SQS dead letter queue"
  type        = bool
  default     = false
}

variable "redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string (\"5\")"
  type        = any
  default     = {}
}

variable "policy" {
  type        = string
  default     = ""
  description = "The JSON policy for the SQS queue."
}

variable "dlq_policy" {
  type        = string
  default     = ""
  description = "The JSON policy for the SQS queue."
}

variable "dlq_name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name"
  type        = string
  default     = null
}