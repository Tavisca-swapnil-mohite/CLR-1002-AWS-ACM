provider "aws" {
  region = var.region
}

# Create an KMS Key for server side encryption
# resource "aws_kms_key" "objects" {
#   description             = "KMS key is used to encrypt bucket objects"
#   deletion_window_in_days = 7
# }

data "aws_caller_identity" "current" {}



module "s3_bucket" {
  source = "../../../modules/storage/s3"
  bucket_name = "${var.bucket_name}"

  tags = {
    Name = "${var.bucket_name}"
  }

  # Versioning is required if object lock is enabled. Otherwise terraform wil fail in execution.
  versioning = {
    status     = true
    mfa_delete = false
  }

  # Note: Object Lock configuration can be enabled only on new buckets
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration
  object_lock_enabled = true
  object_lock_configuration = {
    rule = {
      default_retention = {
        mode = "GOVERNANCE"
        days = 1
      }
    }
  }

  # S3 Bucket Ownership Controls
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"

  expected_bucket_owner = data.aws_caller_identity.current.account_id

  acl = "private"

  # If no kms key arn is provided in "kms_master_key_id" then it uses default aws/s3 master key
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        # kms_master_key_id = aws_kms_key.objects.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  # Adds cross origin resource sharing config in s3
  cors_rule = [
    {
      allowed_methods = ["PUT"]
      allowed_origins = ["https://example.com"]
      allowed_headers = ["*"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
    }
  ]

  # Adds multiple lifecycle rules to s3
  lifecycle_rule = [
    {
      id      = "log"
      enabled = true

      filter = {
        tags = {
          some    = "value"
          another = "value2"
        }
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
          }, {
          days          = 60
          storage_class = "GLACIER"
        }
      ]
    },
    {
      id                                     = "log1"
      enabled                                = true
      abort_incomplete_multipart_upload_days = 7

      noncurrent_version_transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 60
          storage_class = "ONEZONE_IA"
        },
        {
          days          = 90
          storage_class = "GLACIER"
        },
      ]

      noncurrent_version_expiration = {
        days = 300
      }
    },
    {
      id      = "log2"
      enabled = true

      filter = {
        prefix                   = "log1/"
        object_size_greater_than = 200000
        object_size_less_than    = 500000
        tags = {
          some    = "value"
          another = "value2"
        }
      }

      noncurrent_version_transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
      ]

      noncurrent_version_expiration = {
        days = 300
      }
    },
  ]

  # To add bucket policy to s3 bucket
  bucket_policy = {
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          "Service": "config.amazonaws.com"
          },
        Action = [
          "s3:GetObject",
          "s3:PutObject",
        ],
        Resource = [
          "arn:aws:s3:::${var.bucket_name}/*"
        ],
      },
    ],
    }


}
