# Creates s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  count = var.create_bucket ? 1 : 0

  bucket              = var.bucket_name
  tags                = merge(var.tags, lookup(var.tags_for_resource, "aws_s3_bucket", {}))
}








