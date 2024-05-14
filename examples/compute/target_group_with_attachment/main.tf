module "target_group" {
  source                           = "../../../modules/compute/target_group"
  target_group_name                = var.target_group_name
  vpc_id_tg                        = var.vpc_id_tg
  deregistration_delay             = var.deregistration_delay
  health_check_path                = var.health_check_path
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  health_check_interval            = var.health_check_interval
  health_check_matcher             = var.health_check_matcher
  target_group_port                = var.target_group_port
  target_group_target_type         = var.target_group_target_type
  stickiness                       = var.stickiness
  target_group_protocol            = var.target_group_protocol
  target_group_protocol_version    = var.target_group_protocol_version
}

module "target_group_attachment" {
  source                   = "../../../modules/compute/target_group_attachment"
  target_group_arn         = module.target_group.default_target_group_arn
  target_id                = var.target_id
  target_group_target_type = var.target_group_target_type
  target_port              = var.target_port
}
