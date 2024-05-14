resource "aws_lb_target_group_attachment" "default" {
  count            = var.target_group_target_type != "lambda" ? 1 : 0
  target_group_arn = var.target_group_arn
  target_id        = var.target_id
  port             = var.target_port
}

resource "aws_lb_target_group_attachment" "lambda_attachment" {
  count            = var.target_group_target_type == "lambda" ? 1 : 0
  target_group_arn = var.target_group_arn
  target_id        = var.target_id
  depends_on       = [aws_lambda_permission.with_lb]
}


resource "aws_lambda_permission" "with_lb" {
  count         = var.target_group_target_type == "lambda" ? 1 : 0
  statement_id  = "AllowExecutionFromlb"
  action        = "lambda:InvokeFunction"
  function_name = split(":", var.target_id)[6]
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = var.target_group_arn
}
