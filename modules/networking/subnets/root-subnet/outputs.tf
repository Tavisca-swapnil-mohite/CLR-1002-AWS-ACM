output "subnet_count" {
  description = "The number of subnets"
  value       = var.subnet_count
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = aws_subnet.subnets.*.id
}

output "tags"{
  description= "tags for subnets"
  value = aws_subnet.subnets.*.tags_all
}

output "route_table_ids" {
  description = "List of route table IDs"
  value       = module.route_tables.*.route_table_ids
  #module.route_tables.route_table_ids.*.id
  
}