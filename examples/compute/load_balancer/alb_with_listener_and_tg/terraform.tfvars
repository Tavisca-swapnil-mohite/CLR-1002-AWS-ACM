name                             = "testalb-1"
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
target_group_protocol             = "HTTP"
target_group_protocol_version     = "HTTP1"
target_group_name                 = "testtg-1"
availability_zones                = ["us-east-1a", "us-east-1b"]
vpc_cidr_block                    = "10.238.32.0/20"
http_enabled                      = true
http_redirect                     = false
cross_zone_load_balancing_enabled = true
ip_address_type                   = "ipv4"
security_group_ids                = ["sg-0529be6bea90f8657"]
subnet_ids                        = ["	subnet-04c8a1cce0a80f526", "	subnet-08792a1a703950fe7"]
create_target_group               = true
