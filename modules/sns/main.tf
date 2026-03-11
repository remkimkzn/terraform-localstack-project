# канал уведомлений SNS 
variable "topic_name" {
  type = string
}

resource "aws_sns_topic" "this" {
  name = var.topic_name
}

output "topic_arn" {
  value = aws_sns_topic.this.arn
}
