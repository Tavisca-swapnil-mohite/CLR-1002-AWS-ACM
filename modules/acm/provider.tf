provider "aws" {
  alias  = "network"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::928814396842:role/cloud-sre-terraform-role"
  }
}