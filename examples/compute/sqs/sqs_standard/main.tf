locals {
  name   = "sre-test-sqs-simple"
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
    #product-appname-service sre-test-sqs
  }
}

################################################################################
# SQS Module
################################################################################

module "default_sqs" {
  source = "../../../../modules/compute/sqs"

  name = "${local.name}-default"

  tags = local.tags
}