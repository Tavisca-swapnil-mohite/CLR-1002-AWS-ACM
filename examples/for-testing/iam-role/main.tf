module "iam-role-policy" {
    source = "../../../modules/for-testing/iam-policy-document"
    statements = [{
        actions = ["ec2:*, sqs:*, dynamodb:*, kms:list*"]
        resources = ["*"]
    }]
}

module "iam-role" {
    source = "../../../modules/for-testing/iam-role"
    name = "my-custom-role"
    inline_policy = [{
        name = "my_inline_policy_1"
        policy = jsonencode({
            Version = "2012-10-17"
            Statement = [{
                Action   = ["ec2:Describe*"]
                Effect   = "Allow"
                Resource = "*"
            }]
        })
    }, {
        name = "my_inline_policy_2"
        policy = module.iam-role-policy.policy_json
    }]
}