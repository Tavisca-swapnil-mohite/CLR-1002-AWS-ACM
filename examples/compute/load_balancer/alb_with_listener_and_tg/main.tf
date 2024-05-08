module "alb" {
  source                            = "../../../../modules/compute/application_load_balancer"
  security_group_ids                = var.security_group_ids
  subnet_ids                        = var.subnet_ids
  internal                          = var.internal
  cross_zone_load_balancing_enabled = var.cross_zone_load_balancing_enabled
  http2_enabled                     = var.http2_enabled
  idle_timeout                      = var.idle_timeout
  ip_address_type                   = var.ip_address_type
  deletion_protection_enabled       = var.deletion_protection_enabled
  name                              = var.name
}

module "target_group" {
  count                            = var.create_target_group ? 1 : 0
  source                           = "../../../../modules/compute/target_group"
  target_group_name                = var.target_group_name
  vpc_id_tg                        = var.vpc_id_tg
  target_group_port                = var.target_group_port
  target_group_target_type         = var.target_group_target_type
  stickiness                       = var.stickiness
  target_group_protocol            = var.target_group_protocol
  target_group_protocol_version    = var.target_group_protocol_version
  deregistration_delay             = var.deregistration_delay
  health_check_path                = var.health_check_path
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  health_check_interval            = var.health_check_interval
  health_check_matcher             = var.health_check_matcher
}

module "listener" {
  source            = "../../../../modules/compute/listener"
  depends_on        = [module.target_group]
  target_group_arn  = var.create_target_group ? module.target_group[*].default_target_group_arn : var.target_group_arn
  load_balancer_arn = module.alb.alb_arn
  listener_name     = var.listener_name
  http_enabled      = var.http_enabled
  http_redirect     = var.http_redirect
}


