module "iam_policy" {
    source = "../../../modules/for-testing/iam-policy"
    #source = "git::https://github.com/TaviscaSolutions/central-iac//modules/for-testing/iam-policy?ref=bootstrap-utility-enhancements"
    name = "my-policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = ["ec2:Describe*",]
            Effect   = "Allow"
            Resource = "*"
        }]
    })
}