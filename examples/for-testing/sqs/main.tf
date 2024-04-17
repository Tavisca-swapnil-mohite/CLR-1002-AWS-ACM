module "my_sqs_queue" {
    source = "git::https://github.com/TaviscaSolutions/central-iac//modules/for-testing/sqs?ref=bootstrap-utility-enhancements"
    queue_name = var.queue_name
    is_fifo_queue = var.is_fifo_queue
}