# modules/main.tf - модуль переиспользуемый для создания s3 bucket 
# шаблон для имени 
variable "bucket_name" {
  type = string
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}