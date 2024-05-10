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

