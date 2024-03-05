module "vpc" {
  source = "./modules/vpc"
  
  name = var.name
  cidr = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.resource_tags_vpc,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_vpc.AppName}-${module.vpc.global_module_vpc}"
     }
    
  )
}