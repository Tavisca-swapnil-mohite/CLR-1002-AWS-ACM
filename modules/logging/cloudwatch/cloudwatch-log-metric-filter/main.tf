resource "aws_cloudwatch_log_metric_filter" "this" {
    name           = var.name
    pattern        = var.pattern
    log_group_name = var.log_group_name
    metric_transformation {
        name          = var.metric_transformation.name
        namespace     = var.metric_transformation.namespace
        value         = var.metric_transformation.value
        default_value = var.metric_transformation.default_value
        unit          = var.metric_transformation.unit
        dimensions    = var.metric_transformation.dimensions
  }
}