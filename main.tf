
#vpc module
module "vpc" {
  source = "./modules/vpc"
  
  name = local.config.name
  cidr = local.config.cidr
  azs             = local.config.azs
  private_subnets = local.config.private_subnets
  public_subnets  = local.config.public_subnets
  tags = merge(
    var.mandate_tags,
    var.additional_tags_1,
    {
      "ProductName" = var.prname

       }
   )
}

/*
module "ec2-instance" { 
  source= "./modules/ec2"
     
  name                    = var.ec2_name
  ami                     = var.ami
  instance_type          = var.instance_type
  key_name               = "tf-key-pair4"
  monitoring             = false
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = module.vpc.public_subnets[0]
  tags = merge(
    var.mandate_tags,
    {
      "ProductName" = var.prname

       }
   )
}

*/
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "security-gp"
  description = "Security group for ec2"
  vpc_id      = module.vpc.vpc_id
  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
  tags = merge(
    var.mandate_tags,
     {
         "ProductName" = var.prname
              }
  
     )
}

