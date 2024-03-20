module "managed-policy" {
    source = "./iam-managed-policy"
    tags_in = var.role_tags
}

resource "aws_iam_role" "tf_iam_role" {
  name                = var.iam_role_in
  force_detach_policies = true
  assume_role_policy  = "${file("${path.root}/${var.env_in}-assume-role-policy.json")}"
  managed_policy_arns = module.managed-policy.policy_arn
  tags = var.role_tags
}
