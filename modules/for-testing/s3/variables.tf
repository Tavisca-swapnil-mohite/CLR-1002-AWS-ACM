variable "bucket_name" {
    description = "Globally unique bucket name"
}

variable "bucket_acl" {
    description = "Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
    default = "private"
}

variable "enable_versioning" {
    description = "Enable versioning for S3 bucket ?"
    default = false
}

variable "resource_based_policy" {
    type = list(
        object({
            principal = string
            identifier = list(string)
            actions = list(string)
            resources = list(string)
        })
    )
    default = null
}

[{
        "principal" = "Service"
        "identifier" = "ec2.amazonaws.com"
        "actions" = "[s3:*]"
        "resources" = "*"
},{
        "principal" = "Service"
        "identifier" = "lambda.amazonaws.com"
        "actions" = "[ec2:*]"
        "resources" = "*"
}]