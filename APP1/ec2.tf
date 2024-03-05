
module "ec2" {
  source  = "./modules/ec2"

  name = "single-instance"
  instance_type          = "t2.micro"
  key_name               = "test1"
  monitoring             = false
  vpc_security_group_ids = ["sg-04134249a94a75ad2","sg-0fe015a39fcda25de"]
  subnet_id              = module.vpc.public_subnets[0]
  tags = merge(
    local.mandate_tags,
    var.common_tags,
    var.resource_tags,
    var.resource_tags_ec2,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_ec2.AppName}-${module.ec2.global_module_ec2}"
     }
    
  )

  
}

