# modules/main.tf - модуль переиспользуемый для создания s3 bucket 
# шаблон для имени 
# + Добавить переменную для SNS topic
# при событии ObjectCreated S3 отправляет сообщение в SNS

variable "bucket_name" {
  type = string
}

variable "sns_topic_arn" {
  type = string
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_notification" "this" {
  bucket = aws_s3_bucket.this.id

  topic {
    topic_arn = var.sns_topic_arn
    events    = ["s3:ObjectCreated:*"]
  }
}