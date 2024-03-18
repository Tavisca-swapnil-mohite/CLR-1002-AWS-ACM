# Allows s3 encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  count = var.create_bucket && length(keys(var.server_side_encryption_configuration)) > 0 ? 1 : 0

  bucket                = aws_s3_bucket.s3_bucket[0].bucket
  expected_bucket_owner = var.expected_bucket_owner

  dynamic "rule" {
    for_each = try(flatten([var.server_side_encryption_configuration["rule"]]), [])

    content {
      bucket_key_enabled = try(rule.value.bucket_key_enabled, null)

      dynamic "apply_server_side_encryption_by_default" {
        for_each = try([rule.value.apply_server_side_encryption_by_default], [])

        content {
          sse_algorithm     = apply_server_side_encryption_by_default.value.sse_algorithm
          kms_master_key_id = try(apply_server_side_encryption_by_default.value.kms_master_key_id, null)
        }
      }
    }
  }
}