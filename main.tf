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
    var.additional_tags_vpc,
    {
     Name = "${local.mandate_tags.Product}-${var.additional_tags_vpc.AppName}-vpc"
     },
    {
     BusinessUnit = "${local.config.env}"
     }
  )
}

/*
##########################################################################################################
module "ec2-instance" { 
  source= "./modules/ec2"
     
  name                    = var.ec2_name
  ami                     = var.ami
  instance_type          = var.instance_type
  key_name               = "tf-key-pair4"
  monitoring             = false
  vpc_security_group_ids = [module.security_group1.security_group_id,module.security_group2.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.additional_tags_ec2,
    {
     Name = "${local.mandate_tags.Product}-${var.additional_tags_ec2.AppName}-ec2"
    },
    {
     BusinessUnit = "${local.config.env}"
     }
  )
  
}

##########################################################################################################

module "security_group1" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "newsg1"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.additional_tags_sg1,
    {
      Name = "${local.mandate_tags.Product}-${var.additional_tags_sg1.AppName}-sg1"
    },
    {
     BusinessUnit = "${local.config.env}"
     }
  ) 
}
#-----------------------------------------------------------------------------------------------------------------------
module "security_group2" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "newsg2"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["https-443-tcp"]
  egress_rules        = ["all-all"]

  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.additional_tags_sg2,
    {
     Name = "${local.mandate_tags.Product}-${var.additional_tags_sg2.AppName}-sg2"
    },
    {
     BusinessUnit = "${local.config.env}"
    }
  ) 
}

*/
######################################################################################################################################