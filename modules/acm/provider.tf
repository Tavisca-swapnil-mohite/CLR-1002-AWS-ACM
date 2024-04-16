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
    # Uncomment the below line when the acm role is created.
    # role_arn = data.aws_iam_role.acmrole.arn 
    role_arn = "arn:aws:iam::669257908692:role/terraform-sre2-role"
  }
}