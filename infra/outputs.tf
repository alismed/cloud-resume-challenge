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