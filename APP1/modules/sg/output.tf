output "security_group_id" {
  value = aws_security_group.public.id
}

output "default_module_sg" {
  value = local.module
}


 
