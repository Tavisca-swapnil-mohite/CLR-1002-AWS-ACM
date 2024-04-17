variable "queue_name" {
    description = "Queue name. If fifo queue, name should be like 'terraform-example-queue.fifo' "
    default = "terraform-example-queue.fifo"
}

variable "is_fifo_queue" {
   default = true
}