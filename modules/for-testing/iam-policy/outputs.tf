output "policy_arn" {
    value = aws_iam_policy.policy.arn
}

output "policy_json" {
    value = data.aws_iam_policy_document.policy_document.json
}