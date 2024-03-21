provider "aws" {
  alias  = "network"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::928814396842:role/cloud-sre-terraform-role"
  }
}

provider "aws" {
  alias  = "acm"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::669257908692:role/terraform-sre2-role"
  }
}