resource "aws_cloudwatch_log_group" "this" {
    name = var.name
    name_prefix = var.name_prefix
    skip_destroy = var.skip_destroy
    retention_in_days = var.retention_in_days
    log_group_class = var.log_group_class
    kms_key_id = var.kms_key_id
    tags = {
        Name = "${data.aws_default_tags.default.tags.Product}-${data.aws_default_tags.default.tags.AppName}-${var.name}-log-group"
    }
}

resource "aws_cloudwatch_log_stream" "this" {
    name           = "${aws_cloudwatch_log_group.this.name}-log-stream"
    log_group_name = aws_cloudwatch_log_group.this.name
}

data "aws_default_tags" "default" {}