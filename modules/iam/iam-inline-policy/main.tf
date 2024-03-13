resource "aws_iam_role_policy" "tf_inline_policy" {
  name = var.policy_name_in
  role = var.role_in
  policy = "${file("${path.root}/poc-inline-policy.json")}"
}
