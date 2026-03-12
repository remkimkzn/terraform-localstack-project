# вызываем моуль s3 и задаем имя bucket
# подключили модуль DynamoDB  NoSQL
# модули очередь и уведомления
# + ARN передать очереди

module "storage" {
  source      = "../../modules/s3"
  bucket_name = "terraform-localstack-bucket"
  sns_topic_arn = module.notifications.topic_arn
}

module "database" {
  source     = "../../modules/dynamodb"
  table_name = "terraform-localstack-table"
}

module "queue" {
  source     = "../../modules/sqs"
  queue_name = "terraform-localstack-queue"
}

module "notifications" {
  source     = "../../modules/sns"
  topic_name = "terraform-localstack-topic"
  sqs_queue_arn = module.queue.queue_arn
}