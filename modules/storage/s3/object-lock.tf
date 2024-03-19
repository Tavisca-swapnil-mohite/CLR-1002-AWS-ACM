# Allows object lock on s3
resource "aws_s3_bucket_object_lock_configuration" "lock_configuration" {
  count = var.create_bucket && var.object_lock_enabled && try(var.object_lock_configuration.rule.default_retention, null) != null ? 1 : 0

  bucket                = aws_s3_bucket.s3_bucket[0].bucket
  expected_bucket_owner = var.expected_bucket_owner
  token                 = try(var.object_lock_configuration.token, null)

  rule {
    default_retention {
      mode  = var.object_lock_configuration.rule.default_retention.mode
      days  = try(var.object_lock_configuration.rule.default_retention.days, null)
      years = try(var.object_lock_configuration.rule.default_retention.years, null)
    }
  }

  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.bucket_versioning[0]]
}