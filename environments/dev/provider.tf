# подключаем LocalStack вместо реального AWS из root например

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"

  # Отключаем проверки, которые LocalStack не поддерживает
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  # Включаем path style для S3
  s3_use_path_style = true

  endpoints {
    s3       = "http://localhost:4566" # s3 — объектное хранилище (файлы, бакеты)
    dynamodb = "http://localhost:4566" # dynamodb — NoSQL база данных 
    sns      = "http://localhost:4566" # sns — сервис уведомлений (Simple Notification Service) 
    sqs      = "http://localhost:4566" # sqs — очереди сообщений (Simple Queue Service)
    lambda   = "http://localhost:4566" # lambda — бессерверные 
    sts      = "http://localhost:4566"  # сервис для временных токенов и ролей важно указать, чтобы Terraform не уходил в реальный STS
  }
}