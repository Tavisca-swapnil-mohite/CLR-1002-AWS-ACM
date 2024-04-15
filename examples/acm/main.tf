module acm {
  source  = "../../modules/acm"
  domain_name = var.domain_name

  subject_alternative_names = var.subject_alternative_names

  tags = var.tags
}

