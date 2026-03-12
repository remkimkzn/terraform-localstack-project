# канал уведомлений SNS 
# + Публикация → SNS топик → Подписка → SQS очередь → Получатель
variable "topic_name" {
  type = string
}

variable "sqs_queue_arn" {
  type = string
}

resource "aws_sns_topic" "this" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "sqs" {
  topic_arn = aws_sns_topic.this.arn
  protocol  = "sqs"
  endpoint  = var.sqs_queue_arn
}

output "topic_arn" {
  value = aws_sns_topic.this.arn
}
