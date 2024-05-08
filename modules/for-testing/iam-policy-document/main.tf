data "aws_iam_policy_document" "policy_document" {
    dynamic "statement" {
        for_each = var.statements
        content {
            actions         = statement.value.actions
            resources       = statement.value.resources
            dynamic "condition" {
                for_each = lookup(statement.value, "condition", [])
                #for_each = statement.value.condition != null ? statement.value.condition : []
                content {
                    test     = condition.value["test"]
                    values   = condition.value["values"]
                    variable = condition.value["variable"]
                }
            }
        }
    }
}