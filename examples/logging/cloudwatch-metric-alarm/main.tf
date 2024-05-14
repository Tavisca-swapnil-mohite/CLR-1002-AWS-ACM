module "metric_alarms" {
  source  = "git::https://github.com/TaviscaSolutions/central-iac//modules/logging/cloudwatch/cloudwatch-metric-alarm?ref=cloudwatch-module"

  alarm_name          = "lambda-duration-"
  alarm_description   = "Lambda duration is too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 10
  period              = 60
  unit                = "Milliseconds"

  namespace   = "AWS/Lambda"
  metric_name = "Duration"
  statistic   = "Maximum"

  dimensions = {
    FunctionName = "my-test-func"
  }

  alarm_actions = ["arn:aws:sns:eu-west-1:835367859852:my-sns-queue"]
}