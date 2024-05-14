resource "aws_cloudwatch_query_definition" "this" {
    name = var.name
    log_group_names = var.log_group_names
    query_string = var.query_string
}