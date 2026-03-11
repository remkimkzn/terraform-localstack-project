# вызываем моуль s3 и задаем имя bucket
# подключили модуль DynamoDB  NoSQL
module "storage" {
  source      = "../../modules/s3"
  bucket_name = "terraform-localstack-bucket"
}

module "database" {
  source     = "../../modules/dynamodb"
  table_name = "terraform-localstack-table"
}