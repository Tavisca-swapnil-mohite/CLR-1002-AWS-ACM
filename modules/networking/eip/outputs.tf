output "natgw_ids" {
  description = "List of NAT GW IDs"
  value       = aws_eip.natgw.*.id
}