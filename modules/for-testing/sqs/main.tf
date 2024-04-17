resource "aws_sqs_queue" "my_queue" {
  name                        = var.queue_name
  fifo_queue                  = var.is_fifo_queue
  content_based_deduplication = true
  tags = {
      Name = "${data.aws_default_tags.default.tags.Product}-${data.aws_default_tags.default.tags.AppName}-${var.queue_name}-queue"
  }
}

data "aws_default_tags" "default" {}