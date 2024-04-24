data "aws_iam_policy_document" "policy_document" {
    dynamic "statement" {
        for_each = var.statements
        content {
            actions         = statement.value.actions
            resources       = statement.value.resources
            dynamic "condition" {
                for_each = statement.value.condition != null ? statement.value.condition : []
                content {
                    test     = condition.value["test"]
                    values   = condition.value["values"]
                    variable = condition.value["variable"]
                }
            }
        }
    }
}

resource "aws_iam_policy" "policy" {
    path        = "/"
    policy = data.aws_iam_policy_document.policy_document.json
    tags = {
        Name = "${data.aws_default_tags.default.tags.Product}-${data.aws_default_tags.default.tags.AppName}-policy"
    }
}

data "aws_default_tags" "default" {}