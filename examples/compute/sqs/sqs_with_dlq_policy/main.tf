data "aws_caller_identity" "current" {}

locals {
  name   = "sre-sqs-dlq-policy"
  region = "us-east-1"

  tags = {
    Name               = local.name
    Example            = "complete"
    AppName            = "Test"
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = "IaaC module for Provisioning"
    Product            = "sre"
  }
}

################################################################################
# SQS Module
################################################################################
module "sqs_with_dlq" {
  source = "../../../../modules/compute/sqs"
  # This creates both the queue and the dead letter queue together
  name                            = "${local.name}-sqs-with-dlq"
  create_dlq                      = var.create_dlq
  redrive_policy                  = var.redrive_policy
  create_dlq_redrive_allow_policy = false
  tags                            = local.tags
  dlq_name                        = var.dlq_name
  dlq_policy                      = data.aws_iam_policy_document.dlq_sqs_policy_document.json
  policy                          = data.aws_iam_policy_document.sqs_policy_document.json

}

data "aws_iam_policy_document" "sqs_policy_document" {
  version = "2012-10-17"
  statement {
    sid    = "First"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = ["sqs:SendMessage"]
    resources = [
      format("arn:aws:sqs:${local.region}:%s:${local.name}-sqs-with-dlq", data.aws_caller_identity.current.account_id)
    ]
  }
}

data "aws_iam_policy_document" "dlq_sqs_policy_document" {
  version = "2012-10-17"
  statement {
    sid    = "dlqfirst"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = ["sqs:SendMessage"]
    resources = [
      format("arn:aws:sqs:${local.region}:%s:${var.dlq_name}", data.aws_caller_identity.current.account_id)
    ]
  }
}





