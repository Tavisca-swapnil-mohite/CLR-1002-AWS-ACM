variable "name" {
    type = string
    description = "The name of the query."
}

variable "query_string" {
    type = string
    description = "The query string for cloudwatch logs. https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html"
}

variable "log_group_names" {
    type = list(string)
    description = "Specific log groups to use with the query."
    default = []
}