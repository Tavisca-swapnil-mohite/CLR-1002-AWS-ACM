
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  name = var.name
  cidr = var.cidr  
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets 
  tags  = var.tags

  enable_nat_gateway = false
  enable_vpn_gateway = true
  

 
}