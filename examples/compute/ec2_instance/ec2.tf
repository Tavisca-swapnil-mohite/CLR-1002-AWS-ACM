#####################################key pair################################################
module "ec2_key_pair" {
  source = "../../../modules/compute/ec2_key_pair"

  new_key_pair         = var.new_key_pair
  existing_key_pair    = var.existing_key_pair
  public_key           = var.public_key
  key_name             = var.key_name
  tags                  = var.tags

}
#############################################ec2 ################################################
module "ec2_instance" {
  source = "../../../modules/compute/ec2_instance"

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

  iam_instance_profile = var.iam_instance_profile

  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  root_block_device                    = var.root_block_device
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