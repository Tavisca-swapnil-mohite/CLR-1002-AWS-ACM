# Adds bucket policy to s3 bucket 
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  count = try(var.bucket_policy, null) != null ? 1 : 0
  bucket = var.bucket_name
  policy = local.bucket_policy
}
