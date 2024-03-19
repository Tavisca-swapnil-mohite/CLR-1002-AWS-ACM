locals {
  name   = "sre-test-sqs-cmk"
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

module "cmk_encrypted_sqs" {
  source = "../../../../modules/compute/sqs"

  name            = "${local.name}-cmk"
  use_name_prefix = true

  kms_master_key_id                 = aws_kms_key.this.id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  # Dead letter queue
  create_dlq     = var.create_dlq
  redrive_policy = var.redrive_policy

  tags = local.tags
}

################################################################################
# Supporting resources
################################################################################

resource "aws_kms_key" "this" {
  tags = local.tags
}