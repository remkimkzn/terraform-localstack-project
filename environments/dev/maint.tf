module "storage" {
  source      = "../../modules/s3"
  bucket_name = "terraform-localstack-bucket"
}

