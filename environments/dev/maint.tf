# вызываем моуль s3 и задаем имя bucket
module "storage" {
  source      = "../../modules/s3"
  bucket_name = "terraform-localstack-bucket"
}

