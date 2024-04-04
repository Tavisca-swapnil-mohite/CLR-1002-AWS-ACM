module acm {
  source  = "../../modules/acm"
  domain_name = "wwwpoc.net"
  zone_id     = "Z04304331OGX97SQM2XED"

  validation_method = "DNS"

  subject_alternative_names = [
      "*.wwwpoc.net",
      "test.wwwpoc.net"
  ]

  tags = {
    Name               = "test-acm-sre"
    Example            = "complete"
    AppName            = "test-acm"
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = "IaaC module for Provisioning"
    Product            = "sre"

  }
}

