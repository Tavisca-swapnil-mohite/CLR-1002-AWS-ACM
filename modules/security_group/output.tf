output "global_module_security_group" {
  value = local.module
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

