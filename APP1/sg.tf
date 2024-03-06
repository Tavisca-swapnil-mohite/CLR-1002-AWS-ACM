

module "security_group_1" {
  source = "./modules/sg"

  name        = "${local.mandate_tags.Product}-${var.resource_tags_sg1.AppName}-${module.security_group_1.global_module_sg}"
  description = "Security Group 1"
  vpc_id      = module.vpc.vpc_id  # Update with your VPC ID

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = merge(
    local.mandate_tags,
    var.resource_tags,
    var.common_tags,
    var.resource_tags_sg1,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_sg1.AppName}-${module.security_group_1.global_module_sg}"
     }
  )
}

module "security_group_2" {
  source = "./modules/sg"

  name        = "${local.mandate_tags.Product}-${var.resource_tags_sg2.AppName}-${module.security_group_2.global_module_sg}"
  description = "Security Group 2"
  vpc_id      = module.vpc.vpc_id  # Update with your VPC ID

  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.resource_tags,
    var.resource_tags_sg2,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_sg2.AppName}-${module.security_group_2.global_module_sg}"
     }
  )
}




