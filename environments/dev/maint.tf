# вызываем моуль s3 и задаем имя bucket
# подключили модуль DynamoDB  NoSQL
# модули очередь и уведомления
module "storage" {
  source      = "../../modules/s3"
  bucket_name = "terraform-localstack-bucket"
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
}