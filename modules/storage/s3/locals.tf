locals {
  bucket_policy           = try(jsonencode(var.bucket_policy), var.bucket_policy)
  cors_rules              = try(jsondecode(var.cors_rule), var.cors_rule)
  lifecycle_rules      = try(jsondecode(var.lifecycle_rule), var.lifecycle_rule)
}