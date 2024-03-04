
output "global_module_ec2" {
  value = module.ec2.global_module_ec2
}

output "global_module_vpc" {
  value = module.vpc.global_module_vpc
}

output "global_module_security_group" {
  value = module.security_group.global_module_security_group
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "common_product" {
  value = local.mandate_tags.Product
}




/*
output "default_module_ec2" {
  value = module.ec2-instance.default_module_ec2
}

output "default_module_sg2" {
  value = module.security_group2.default_module_sg
}

output "sg1_id" {
value = module.security_group1.security_group_id
}
output "sg1_vpc_id" {
value = module.security_group1.security_group_vpc_id
}

*/