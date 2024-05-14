output "cloudwatch-log-group-name" {
    value = module.cloudwatch_log_group.cloudwatch_log_group_name
}

output "cloudwatch-log-stream-name" {
    value = module.cloudwatch_log_group.cloudwatch_log_stream_name
}