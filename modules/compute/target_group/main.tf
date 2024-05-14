resource "aws_lb_target_group" "default" {
  name                          = var.target_group_name
  port                          = var.target_group_port
  protocol                      = var.target_group_protocol
  protocol_version              = var.target_group_protocol_version
  vpc_id                        = var.vpc_id_tg
  target_type                   = var.target_group_target_type
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
  deregistration_delay          = var.deregistration_delay
  slow_start                    = var.slow_start

  health_check {
    protocol            = var.health_check_protocol != null ? var.health_check_protocol : var.target_group_protocol
    path                = var.health_check_path
    port                = var.health_check_port
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
  }

  dynamic "stickiness" {
    for_each = var.stickiness == null ? [] : [var.stickiness]
    content {
      type            = "lb_cookie"
      cookie_duration = stickiness.value.cookie_duration
      enabled         = var.target_group_protocol == "TCP" ? false : stickiness.value.enabled
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
