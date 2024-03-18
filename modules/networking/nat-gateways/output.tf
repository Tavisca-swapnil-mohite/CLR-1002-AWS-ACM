output "nat_gateway_count" {
  description = "The number of gateways"
  value       = var.natgw_count
}

output "nat_gateway_ids" {
  description = "List of gateway IDs"
  value       = aws_nat_gateway.natgw.*.id
}

output "nat_gateway_public_ips" {
  description = "List of public IPs belonging to the Nat Gateways"
  value       = aws_nat_gateway.natgw.*.public_ip
}
