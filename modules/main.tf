module "alb" {
  source                           = "./alb"
  infraOwner                       = var.infraOwner
  dataClassification               = var.dataClassification
  environment                      = var.environment
  name                             = var.name
  appName                          = var.appName
  backup                           = var.backup
  product                          = var.product
  businessUnit                     = var.businessUnit
  internal                         = var.internal
  subnets                          = var.subnets
  security_groups                  = var.security_groups
  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
}

module "listener" {
  source              = "./listener"
  listener_port       = var.listener_port
  listener_protocol   = var.listener_protocol
  default_action_type = var.default_action_type
  load_balancer_arn   = module.alb.alb_arn
  target_group_arn    = module.target_group.target_group_arn
}

module "target_group" {
  source                           = "./target_group"
  target_group_name                = var.target_group_name
  target_group_port                = var.target_group_port
  target_group_protocol            = var.target_group_protocol
  vpc_id                           = var.vpc_id
  target_type                      = var.target_type
  health_check_path                = var.health_check_path
  health_check_port                = var.health_check_port
  health_check_protocol            = var.health_check_protocol
  health_check_interval            = var.health_check_interval
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  target_ids                       = var.target_ids
  target_port                      = var.target_port
}



