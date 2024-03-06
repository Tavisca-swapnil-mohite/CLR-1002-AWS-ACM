output "global_module_vpc" {
  value = module.vpc.global_module_vpc
}

output "security_group_1_id" {
  value = module.security_group_1.security_group_ids
}

output "security_group_2_id" {
  value = module.security_group_2.security_group_ids
}

output "global_module_sg" {
  value = module.security_group_1.global_module_sg
}


