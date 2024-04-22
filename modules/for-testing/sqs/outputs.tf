output "queue_id" {
    value = aws_sqs_queue.my_queue.id
}

output "queue_url" {
    value = aws_sqs_queue.my_queue.url
}