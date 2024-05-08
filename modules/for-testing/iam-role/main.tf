data "aws_default_tags" "default" {}

resource "aws_iam_role" "this" {
    name = var.name
    name_prefix = var.name_prefix
    assume_role_policy = var.assume_role_policy
    description = var.description
    path = var.path
    force_detach_policies = var.force_detach_policies
    managed_policy_arns = var.managed_policy_arns
    max_session_duration = var.max_session_duration
    permissions_boundary = var.permissions_boundary
    dynamic "inline_policy" {
        for_each = var.inline_policy
        content {
            name = inline_policy.value.name
            policy = inline_policy.value.policy
        }
    }
    tags = {
        Name = "${data.aws_default_tags.default.tags.Product}-${data.aws_default_tags.default.tags.AppName}-${var.name}-role"
    }
}