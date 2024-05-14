module "iam_policy_doc" {
    source = "../../../modules/for-testing/iam-policy-document"
    statements = [{
        actions = ["ec2:*"]
        resources = ["*"]
    }, {
        actions = ["lambda:*"]
        resources = ["*"]
        condition = [{
            test = "StringEquals"
            variable = "s3:prefix"
            values = ["home/"]
        }]
    }]
}

module "iam_policy" {
    source = "../../../modules/for-testing/iam-policy"
    #source = "git::https://github.com/TaviscaSolutions/central-iac//modules/for-testing/iam-policy?ref=bootstrap-utility-enhancements"
    name = "my-policy"
    policy = module.iam_policy_doc.policy_json
}