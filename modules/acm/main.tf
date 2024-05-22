locals {
  distinct_domain_names = distinct(concat([var.domain_name], [for s in var.subject_alternative_names : replace(s, "*.", "")]))

  validation_domains = [for k, v in aws_acm_certificate.acm_certificate.domain_validation_options : tomap(v) if contains(local.distinct_domain_names, v.domain_name)]
}

data "aws_route53_zone" "route53_zone" {
  provider     = aws.network    # We manage the hosted zones in central network account and acm certs in resp app account and hence, a provider for central account would be needed to fetch the hosted zones.
  name         = var.domain_name
  private_zone = var.private_zone
}

# Uncomment the below lines when the ACM role gets created for every app account
# data "aws_iam_role" "acmrole" { # Get the iam role from the app account which has permissions to create acm cert
#   name = "terraform-sre2-role" #Replace the role name as per the one created by SDLC team
# }

resource "aws_acm_certificate" "acm_certificate" {
  provider                  = aws.acm
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS" # DNS validation should only be used for ACM as per the discussion with app hosting team
  tags                      = var.tags

//key algorithm configuration

key_algorithm = var.key_algorithm

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      subject_alternative_names,
    ]
  }
}

resource "aws_route53_record" "validation" {
  count           = var.validate_certificate ? length(local.distinct_domain_names) : 0
  provider        = aws.network
  zone_id         = data.aws_route53_zone.route53_zone.zone_id
  name            = element(local.validation_domains, count.index)["resource_record_name"]
  type            = element(local.validation_domains, count.index)["resource_record_type"]
  ttl             = var.ttl
  allow_overwrite = var.allow_overwrite_records

  records = [
    element(local.validation_domains, count.index)["resource_record_value"]
  ]

  depends_on = [aws_acm_certificate.acm_certificate]
}

resource "aws_acm_certificate_validation" "acm_certificate_validation" {
  count                   = var.validate_certificate ? 1 : 0
  provider                = aws.acm
  certificate_arn         = aws_acm_certificate.acm_certificate_validation.arn
  validation_record_fqdns = aws_route53_record.validation.*.fqdn
}


