data "aws_default_tags" "default" {}

resource "aws_iam_policy" "this" {
    name_prefix = var.name
    description = var.name_prefix
    path        = var.path
    policy = jsonencode(var.policy)
    tags = {
        Name = "${data.aws_default_tags.default.tags.Product}-${data.aws_default_tags.default.tags.AppName}-${var.name}-policy"
    }
}