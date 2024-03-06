module "vpc" {
  source = "./modules/vpc"
  
  name = ""
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.resource_tags,
    var.resource_tags_vpc,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_vpc.AppName}-${module.vpc.global_module_vpc}"
     }
    
  )
}