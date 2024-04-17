resource "aws_s3_bucket" "example" {
    bucket = var.bucket_name
    tags = {
        Name = "${data.aws_default_tags.default.tags.Product}-${data.aws_default_tags.default.tags.AppName}-${var.bucket_name}-bucket"
    }
}

resource "aws_s3_bucket_acl" "example" {
    bucket = aws_s3_bucket.example.id
    acl    = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "versioning_example" {
    bucket = aws_s3_bucket.example.id
    versioning_configuration {
        status = var.enable_versioning == true ? "Enabled" : "Disabled"
    }
}

data "aws_iam_policy_document" "example_policy" {
    count = var.resource_based_policy == null ? 0 : 1
    dynamic "statement" {
        for_each = var.resource_based_policy
        content {
            principals {
                type        = statement.value["principal"]
                identifiers = statement.value["identifier"]
            }
            actions         = statement.value["actions"]
            resources       = statement.value["resources"]
        }
    }
}

resource "aws_s3_bucket_policy" "example_policy" {
    count = var.resource_based_policy == null ? 0 : 1
    bucket = aws_s3_bucket.example.id
    policy = data.aws_iam_policy_document.example_policy[count.index].json
}

data "aws_default_tags" "default" {}