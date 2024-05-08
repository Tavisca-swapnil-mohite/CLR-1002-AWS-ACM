delete_after_days = 30
key_description = "Key for kms"
kms_alias = "alias/eks-ebs-encrypt-key"
key_policy_statements = {
  "statement1" = { 
    sid = "Enable IAM User Permissions",
    actions = ["kms:*"],
    resources = ["*"],
    effect = "Allow",
    principals =     {
          identifiers  = ["arn:aws:iam::928814396842:root"]
                  },
    }, 
  "statement2" = {
    sid = "Allow access for Key Administrators",
    actions = [
           "kms:Create*",
           "kms:Describe*",
           "kms:Enable*",
           "kms:List*",
           "kms:Put*",
           "kms:Update*",
           "kms:Revoke*",
           "kms:Disable*",
           "kms:Get*",
           "kms:Delete*",
           "kms:TagResource",
           "kms:UntagResource",
           "kms:ScheduleKeyDeletion",
           "kms:CancelKeyDeletion"
          ],
    resources = ["*"],
    effect = "Allow",
    principals =     {
        identifiers  = ["arn:aws:iam::928814396842:role/adfs-devops","arn:aws:iam::928814396842:role/adfs-governance"]
                  },
    }, 
  "statement3" = {
    sid = "Allow use of the key",
    actions = [
           "kms:Encrypt",
           "kms:Decrypt",
           "kms:ReEncrypt*",
           "kms:GenerateDataKey*",
           "kms:DescribeKey"
         ],
    resources = ["*"],
    effect = "Allow",
    principals =     {
          identifiers  = ["arn:aws:iam::928814396842:role/adfs-devops","arn:aws:iam::928814396842:role/aws-service-role/kafka.amazonaws.com/AWSServiceRoleForKafka","arn:aws:iam::928814396842:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_Travel-NonProd-DevOps_58cf51ef9bc19c74"]
                  },
  }
}
tags = {
    AppName            = "eks-travel-stage-ns-issue-replica"
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = "eks-travel-stage-ns-issue-replica"
    Product            = "plt"
}