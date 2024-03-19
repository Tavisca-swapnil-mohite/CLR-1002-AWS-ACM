output "role_arn" {
  value = tomap({
    for k, role in aws_iam_service_linked_role.iam-service-role : k => role.arn
  })
}
