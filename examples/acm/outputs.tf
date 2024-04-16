
output "distinct_domain_names" {
  description = "Distinct domain names."
  value       = module.acm.distinct_domain_names
}

output "validation_domains" {
  description = "Validation domain names."
  value       = module.acm.validation_domains
}