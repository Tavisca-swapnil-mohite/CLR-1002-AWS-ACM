vpc_id_tg                        = "vpc-07b12bcec12a4cd9b"
health_check_path                = "/"
health_check_timeout             = 5
health_check_healthy_threshold   = 5
health_check_unhealthy_threshold = 2
health_check_interval            = 30
health_check_matcher             = null
target_group_port                = 80
target_group_target_type         = "instance"
stickiness = {
  cookie_duration = 86400
  enabled         = false
}
target_group_protocol         = "HTTP"
target_group_protocol_version = "HTTP1"
target_group_name             = "test-1"
target_port                   = 80
target_id                     = "i-072d06e658f8aa799"

