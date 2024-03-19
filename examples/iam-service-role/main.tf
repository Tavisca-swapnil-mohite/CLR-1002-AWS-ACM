resource "aws_iam_service_linked_role" "iam-service-role" {
  for_each = toset(var.service_name_in)
  aws_service_name = each.value
  description = "IAM service role"
  tags = var.tags_in
}
