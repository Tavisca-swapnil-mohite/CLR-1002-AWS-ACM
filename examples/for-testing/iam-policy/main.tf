module "iam_policy" {
    #source = "../../../modules/for-testing/iam-policy"
    source = "git::https://github.com/TaviscaSolutions/central-iac//modules/for-testing/iam-policy?ref=bootstrap-utility-enhancements"
    statements = var.statements
}