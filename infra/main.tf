module "database" {
  source     = "./database"
  table_name = var.table_name
  region     = var.region
  profile    = var.profile

}

module "backend" {
  source               = "./backend"
  region               = var.region
  profile              = var.profile
  lambda_runtime       = var.lambda_runtime
  lambda_function_name = var.lambda_function_name
  visitors_table_arn   = module.database.visitors_table_arn
}

module "frontend" {
  source         = "./frontend"
  region         = var.region
  profile        = var.profile
  s3_bucket_name = var.s3_bucket_name
  index_document = var.index_document
  error_document = var.error_document
}