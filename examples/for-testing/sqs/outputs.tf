output "sqs_id" {
    value = module.my_sqs_queue.queue_id
}

output "sqs_url" {
    value = module.my_sqs_queue.queue_url
}