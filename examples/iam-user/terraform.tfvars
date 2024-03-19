iam_user_in    = "tf-example-user"
tags_in      = {
       Product            = "plt"
       InfraOwner         = "sre-cloud-reliability@tavisca.com"
       Environment        = "qa"
       AppName            = "iac"
       Backup             = "no"
       BusinessUnit       = "travel.poc"
       DataClassification = "internal"
}       
iam_policy_in  = qa-user-policy.json
is_policy_in   = false
aws_region_in  = "us-east-1"
env_in         = "qa"
