module "policy1" {
  source           = "../../../modules/security/iam_policies"

    policy_name   = "policy1"
    policy_description = "policy1 description"
    policy_document = "${file("sample-policy1.json")}"

  }

  module "policy2" {
    source           = "../../../modules/security/iam_policies"

      policy_name   = "policy2"
      policy_description = "policy2 description"
      policy_document = "${file("sample-policy2.json")}"

    }