resource "aws_iam_policy" "tf_managed_policy" {
  name        = "var.policy_name_in"
  description = "Managed policy via Terraform"
  tags = var.tags_in
  policy = "${file("${path.root}/${var.env_in}-managed-policy.json")}"
}

##### Policy attachment will be created if role is passed from calling module

resource "aws_iam_role_policy_attachment" "tf_attach_policy" {
  count      = var.iam_role_in != null ? 0 : 1
  role       = var.iam_role_in
  policy_arn = aws_iam_policy.tf_managed_policy.arn
}

