module "metric_stream" {
  source = "git::https://github.com/TaviscaSolutions/central-iac//modules/logging/cloudwatch/cloudwatch-metric-stream?ref=cloudwatch-module"
  name          = "metric-stream"
  firehose_arn  = "arn:aws:firehose:eu-west-1:835367859852:deliverystream/metric-stream-example"
  output_format = "json"
  role_arn      = "arn:aws:iam::835367859852:role/metric-stream-to-firehose-20240113005123755300000002"

  # conflicts with exclude_filter
  include_filter = {
    ec2 = {
      namespace    = "AWS/EC2"
      metric_names = ["CPUUtilization", "NetworkIn"]
    }
  }

  statistics_configuration = [
    {
      additional_statistics = ["p99"]
      include_metric = [
        {
          namespace   = "AWS/EC2"
          metric_name = "CPUUtilization"
        },
        {
          namespace   = "AWS/EC2"
          metric_name = "NetworkIn"
        }
      ]
    },
    {
      additional_statistics = ["p90", "TM(10%:90%)"]
      include_metric = [
        {
          namespace   = "AWS/EC2"
          metric_name = "CPUUtilization"
        }
      ]
    }
  ]
}