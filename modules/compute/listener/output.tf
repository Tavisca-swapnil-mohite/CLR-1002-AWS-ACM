output "http_listener_arn" {
  description = "The ARN of the HTTP forwarding listener"
  value       = one(aws_lb_listener.http_forward[*].arn)
}

output "http_redirect_listener_arn" {
  description = "The ARN of the HTTP to HTTPS redirect listener"
  value       = one(aws_lb_listener.http_redirect[*].arn)
}

output "https_listener_arn" {
  description = "The ARN of the HTTPS listener"
  value       = one(aws_lb_listener.https[*].arn)
}

output "listener_arns" {
  description = "A list of all the listener ARNs"
  value = compact(
    concat(aws_lb_listener.http_forward[*].arn, aws_lb_listener.http_redirect[*].arn, aws_lb_listener.https[*].arn)
  )
}
