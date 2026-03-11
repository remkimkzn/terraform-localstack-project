# Terraform LocalStack Project

Учебный проект Terraform с эмуляцией AWS через LocalStack.

## Структура
- `modules/s3/` — модуль для создания S3 bucket  
- `environments/dev/` — dev окружение с provider LocalStack  

## Использование
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
awslocal s3 ls   # проверить созданный bucket