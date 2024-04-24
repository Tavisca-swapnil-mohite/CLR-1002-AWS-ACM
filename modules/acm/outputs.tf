output "arn" {
  description = "Certificate ARN."
  value       = aws_acm_certificate.this.arn
}

output "distinct_domain_names" {
  description = "Distinct domain names."
  value       = local.distinct_domain_names
}

output "validation_domains" {
  description = "Validation domain names."
  value       = local.validation_domains
}