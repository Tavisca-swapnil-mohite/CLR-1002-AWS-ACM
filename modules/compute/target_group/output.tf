output "default_target_group_arn" {
  description = "The default target group ARN"
  value       = one(aws_lb_target_group.default[*].arn)
}

output "default_target_group_arn_suffix" {
  description = "The default target group ARN suffix"
  value       = one(aws_lb_target_group.default[*].arn_suffix)
}
