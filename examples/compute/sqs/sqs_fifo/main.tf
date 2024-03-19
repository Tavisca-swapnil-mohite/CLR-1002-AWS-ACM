locals {
  name   = "sre-test-sqs-simple.fifo"
  region = "us-east-1"

  tags = {
    Name               = local.name
    Example            = "complete"
    AppName            = "test"
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

module "fifo_sqs" {
  source = "../../../../modules/compute/sqs"

  # `.fifo` is automatically appended to the name
  # This also means that `use_name_prefix` cannot be used on FIFO queues
  name       = local.name
  fifo_queue = var.fifo_queue

  # Dead letter queue
  create_dlq     = var.create_dlq
  redrive_policy = var.redrive_policy

  tags = local.tags
}