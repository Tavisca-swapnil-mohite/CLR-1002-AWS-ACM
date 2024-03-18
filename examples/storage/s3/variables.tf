variable "region" {
  description = "aws region"
  default = "us-east-1"
}

variable "bucket_name" {
  description = "desired name for s3 bucket"
  default     = "poc-appdr-terraform-demo-s3-bucket"
}