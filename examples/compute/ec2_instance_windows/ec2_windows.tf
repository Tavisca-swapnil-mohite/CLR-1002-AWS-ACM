module "ec2_key_pair" {
  source = "../../../modules/compute/ec2_key_pair"

  new_key_pair         = var.new_key_pair
  existing_key_pair    = var.existing_key_pair
  public_key           = var.public_key
  key_name             = var.key_name

}

module "ec2_windows" {
  source = "../../../modules/compute/ec2_instance_windows"

  count = var.windows_instance_count


  ami                  = var.ami
  instance_type        = var.instance_type
  user_data            = var.user_data
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name             = var.key_name

  get_password_data    = var.get_password_data


  iam_instance_profile = var.iam_instance_profile
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  root_block_device                    = var.root_block_device
  ebs_block_device                     = var.ebs_block_device
  timeouts                             = var.timeouts
  tags                                 = var.tags


}
