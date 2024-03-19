# FIFO
output "fifo_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.queue_id
}

output "fifo_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.fifo_sqs.queue_arn
}

output "fifo_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.queue_url
}

output "fifo_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.fifo_sqs.queue_name
}

output "fifo_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_id
}

output "fifo_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_arn
}

output "fifo_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_url
}

output "fifo_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_name
}

