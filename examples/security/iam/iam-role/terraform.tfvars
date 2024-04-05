iam_role_in    = "tf-example-role"
role_tags      = {
       Product            = "plt"
       InfraOwner         = "sre-cloud-reliability@tavisca.com"
       Environment        = "qa"
       AppName            = "iac"
       Backup             = "no"
       BusinessUnit       = "travel.poc"
       DataClassification = "internal"
}       
aws_region_in  = "us-east-1"
env_in         = "qa"
