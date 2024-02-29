terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region  = "us-east-1"
    bucket  = "iac-terraform-test-backend"
    key     = "terraform/terraform.tfstate"
 
  
  }
}

