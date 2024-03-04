#vpc module
module "vpc" {
  source = "./modules/vpc"
  
  name = local.config.name
  cidr = local.config.cidr
  azs             = local.config.azs
  private_subnets = local.config.private_subnets
  public_subnets  = local.config.public_subnets
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.resource_tags_vpc,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_vpc.AppName}-${module.vpc.global_module_vpc}"
     },
    {
     BusinessUnit = "${local.config.env}"
     }
  )
}
#====================================================================================
#security group module
module "security_group" {
  source = "./modules/security_group"
  

  name        = "newsg1"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["172.0.0.0/20"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.resource_tags_vpc,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_vpc.AppName}-${module.security_group.global_module_security_group}"
     },
    {
     BusinessUnit = "${local.config.env}"
     }
  )
}



##########################################################################################################
module "ec2" { 
  source= "./modules/ec2"
     
  name                    = var.ec2_name
  ami                     = var.ami
  instance_type          = var.instance_type
  key_name               = "tf-key-pair4"
  monitoring             = false
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.resource_tags_ec2,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_ec2.AppName}-${module.ec2.global_module_ec2}"
    }
  )
  
}

