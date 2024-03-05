output "security_group_ids" {
  value = aws_security_group.sg[*].id
}


output "global_module_sg" {
  value = local.module
}
