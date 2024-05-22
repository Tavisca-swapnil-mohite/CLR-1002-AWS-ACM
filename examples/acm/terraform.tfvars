

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

  subject_alternative_names = [
      "*.wwwpoc.net",
      "test.wwwpoc.net"
  ]

  domain_name = "wwwpoc.net"


  validation_method = "DNS"


