resource "aws_iam_user" "tf_iam_user" {
  name = var.iam_user_in
  path = "/"

  tags = var.tags_in
}

##### IAM policy will be created if policy is passed from calling module

resource "aws_iam_policy" "tf_user_policy" {
  count       = var.is_policy_in ? 1 : 0 
  name        = var.iam_policy_in
  description = "IAM policy to be attached to IAM user"
  policy      = "${file("${path.root}/user-policy.json")}"
}

##### IAM policy will be created if policy is passed from calling module 

resource "aws_iam_user_policy_attachment" "tf_policy_attach" {
  count      = try(var.is_policy_in ? 1 : 0, 0)
  user       = aws_iam_user.tf_iam_user.name
  policy_arn = aws_iam_policy.tf_user_policy.arn
}

##### IAM group membership will be added only if list of group is provided to module 

resource "aws_iam_user_group_membership" "example1" {
  count = len(aws_iam_group_in) > 0 ? 1 : 0
  user = aws_iam_user.tf_iam_user.name
  groups = aws_iam_group_in
}
