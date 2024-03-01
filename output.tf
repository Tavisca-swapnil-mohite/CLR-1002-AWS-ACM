
output "vpc_id" {
  value = module.vpc.vpc_id
}


output "common_product" {
  value = local.mandate_tags.Product
}
output "common_app" {
  value = var.additional_tags_vpc.AppName
}

output "sg1_id" {
value = module.security_group1.security_group_id
}
output "sg1_vpc_id" {
value = module.security_group1.security_group_vpc_id
}




