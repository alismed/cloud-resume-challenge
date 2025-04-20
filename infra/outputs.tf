output "lambda_function_arn" {
  description = "ARN da função Lambda principal"
  value       = module.backend.count_visitors_function_arn
}

output "api_gateway_url" {
  description = "URL base do API Gateway HTTP"
  value       = module.backend.api_gateway_url
}

output "dynamodb_table_arn" {
  description = "ARN da tabela DynamoDB de visitantes"
  value       = module.database.visitors_table_arn
}

output "dynamodb_table_name" {
  description = "Nome da tabela DynamoDB de visitantes"
  value       = module.database.visitors_table_name
}

output "api_gateway_visitors_count_url" {
  description = "Endpoint completo para GET /visitors_count"
  value       = "${module.backend.api_gateway_url}/visitors_count"
}

output "cloudfront_distribution_id" {
  description = "ID da distribuição do CloudFront"
  value       = module.frontend.cloudfront_distribution_id
}

output "cloudfront_distribution_domain_name" {
  description = "Nome de domínio da distribuição do CloudFront"
  value       = module.frontend.cloudfront_distribution_domain_name
}

output "cloudfront_url" {
  value = "https://${module.frontend.cloudfront_distribution_domain_name}"
}

output "cloudfront_distribution_arn" {
  description = "ARN da distribuição do CloudFront"
  value       = module.frontend.cloudfront_distribution_arn
}

output "aws_s3_bucket_name" {
  description = "Nome do bucket S3"
  value       = module.frontend.s3_bucket_name
}

output "aws_s3_bucket_website_endpoint" {
  description = "Endpoint do bucket S3"
  value       = module.frontend.s3_bucket_website_endpoint
}

output "aws_s3_bucket_website_arn" {
  description = "ARN do bucket S3"
  value       = module.frontend.s3_bucket_website_arn
}