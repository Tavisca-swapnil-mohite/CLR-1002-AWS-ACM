# Blocks Public Access
resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  count = var.create_bucket && var.attach_public_policy ? 1 : 0

  bucket = aws_s3_bucket.s3_bucket[0].bucket

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  depends_on = [aws_s3_bucket.s3_bucket[0]]
}

# Bucket Ownership Controls
resource "aws_s3_bucket_ownership_controls" "s3_ownership" {
  count = var.create_bucket && var.control_object_ownership ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].bucket

  rule {
    object_ownership = var.object_ownership
  }

  # This `depends_on` is to prevent "A conflicting conditional operation is currently in progress against this resource."
  depends_on = [
    aws_s3_bucket_public_access_block.s3_public_access[0],
    aws_s3_bucket.s3_bucket[0]
  ]
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  count = var.create_bucket && var.acl != null ? 1 : 0

  # This `depends_on` is to prevent "AccessControlListNotSupported: The bucket does not allow ACLs."
  depends_on = [aws_s3_bucket_ownership_controls.s3_ownership]

  bucket                = aws_s3_bucket.s3_bucket[0].bucket
  expected_bucket_owner = var.expected_bucket_owner
  acl = var.acl == "null" ? null : var.acl

}