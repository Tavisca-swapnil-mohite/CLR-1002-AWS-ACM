
################################################################# EC2 - REGULAR ####################################################################
module "ec2_regular" {
  source = "./example/ec2_instance"

  count = var.instance_count

  #new_key_pair         = false
  #existing_key_pair    = false

  ami                  = var.ami  
  instance_type        = var.instance_type
  user_data            = var.user_data
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name             = var.key_name
  monitoring           = var.monitoring
  get_password_data    = var.get_password_data
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile = var.iam_instance_profile 
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  tenancy                              = var.tenancy
  ebs_block_device                     = var.ebs_block_device
  timeouts                             = var.timeouts
  tags = merge(
    local.mandate_tags,
    var.org_standards_tags,
    var.environment_tags,
    var.resource_tags_ec2,
    var.resource_tags,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_ec2.AppName}-${local.module_names.ec2}-regular-${count.index + 1}"
     }
    
  )

}

################################################################# EC2 - SPOT ####################################################################
module "ec2_spot" {
  source = "./example/ec2_instance"

  count = var.spot_instance_count

  create_spot_instance = false
  
  spot_price           = var.spot_price
  spot_type            = var.spot_type
  
  ami                  = var.ami
  instance_type        = var.instance_type
  user_data            = var.user_data
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name             = var.key_name
  monitoring           = var.monitoring
  get_password_data    = var.get_password_data
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile = var.iam_instance_profile 
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  tenancy                              = var.tenancy
  timeouts                             = var.timeouts

  tags = merge(
    local.mandate_tags,
    var.org_standards_tags,
    var.environment_tags,
    var.resource_tags_ec2,
    var.resource_tags,
    {
     Name = "${local.mandate_tags.Product}-${var.resource_tags_ec2.AppName}-${local.module_names.ec2}-spot-${count.index + 1}"
     }
    
  )

}

