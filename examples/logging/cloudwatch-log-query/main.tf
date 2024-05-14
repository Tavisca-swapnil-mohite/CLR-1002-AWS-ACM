module "query_definition" {
  source = "git::https://github.com/TaviscaSolutions/central-iac//modules/logging/cloudwatch/cloudwatch-log-query?ref=cloudwatch-module"
  name = "query-example"
  log_group_names = ["my-log-group"]
  query_string = <<EOF
fields @timestamp, @message
| sort @timestamp desc
| limit 25
EOF
}