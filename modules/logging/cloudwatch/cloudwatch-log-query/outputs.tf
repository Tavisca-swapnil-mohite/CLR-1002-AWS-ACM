output "cloudwatch_query_definition_id" {
  description = "The query definition id."
  value       = try(aws_cloudwatch_query_definition.this.query_definition_id, "")
}