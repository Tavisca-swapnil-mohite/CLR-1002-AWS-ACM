output "public_nacl" {
  value = aws_network_acl.public_nacl.id
}
output "app_nacl" {
  value = aws_network_acl.app_nacl.id
}
output "web_nacl" {
  value = aws_network_acl.web_nacl.id
}
output "data_nacl" {
  value = aws_network_acl.data_nacl.id
}
output "mgmt_nacl" {
  value = aws_network_acl.mgmt_nacl.id
}