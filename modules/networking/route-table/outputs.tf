output "route_table_ids" {
  description = "List of route table IDs"
  value       = aws_route_table.default.id
}