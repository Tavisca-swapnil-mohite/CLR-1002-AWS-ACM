module "cloudwatch_log_group" {
    #source = "../../../modules/logging/cloudwatch/cloudwatch-log-group"
    source = "git::https://github.com/TaviscaSolutions/central-iac//modules/logging/cloudwatch/cloudwatch-log-group?ref=cloudwatch-module"
    name = "my-log-group"
}