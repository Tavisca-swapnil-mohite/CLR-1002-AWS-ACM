resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = var.default_action_type
    target_group_arn = var.target_group_arn
  }
}
