data "aws_default_tags" "default" {}

resource "aws_iam_policy" "this" {
    name = var.name
    name_prefix = var.name_prefix
    description = var.description
    path        = var.path
    policy = jsonencode(var.policy)
    tags = {
        Name = "${data.aws_default_tags.default.tags.Product}-${data.aws_default_tags.default.tags.AppName}-${var.name}-policy"
    }
}