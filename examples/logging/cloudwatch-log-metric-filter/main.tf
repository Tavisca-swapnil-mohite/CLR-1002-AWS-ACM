module "log_metric_filter" {
  source  = "git::https://github.com/TaviscaSolutions/central-iac//modules/logging/cloudwatch/cloudwatch-log-metric-filter?ref=cloudwatch-module"
  log_group_name = "my-log-group"
  name    = "error-metric"
  pattern = "ERROR"
  metric_transformation = {
    name      = "EventCount"
    namespace = "YourNamespace"
    value     = "1"
  }
}