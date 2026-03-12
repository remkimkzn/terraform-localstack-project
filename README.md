# Terraform + LocalStack Project

Проект демонстрирует использование Terraform для создания локальной AWS-инфраструктуры через **LocalStack**.  
Подходит для middle-level практики: модули, зависимости, event-driven архитектура.

---

## Структура проекта

```text
modules/
├─ s3/        # S3 bucket + event notification
├─ dynamodb/  # DynamoDB table
├─ sns/       # SNS topic + subscription на SQS
└─ sqs/       # SQS queue + policy

environments/dev/
├─ main.tf         # Подключение всех модулей
├─ provider.tf     # Настройка provider LocalStack


# 1. Создать тестовый файл
echo "hello terraform" > test.txt

# 2. Загрузить файл в S3
awslocal s3 cp test.txt s3://terraform-localstack-bucket

# 3. Проверить очереди SQS
awslocal sqs list-queues

# 4. Получить сообщение из очереди
awslocal sqs receive-message \
  --queue-url http://localhost:4566/000000000000/terraform-localstack-queue