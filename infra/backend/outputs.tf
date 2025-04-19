output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = aws_lambda_function.count_visitors.arn
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.count_visitors.function_name
}

output "lambda_function_qualified_arn" {
  description = "The ARN identifying your Lambda Function Version"
  value       = aws_lambda_function.count_visitors.qualified_arn
}

output "lambda_function_version" {
  description = "Latest published version of Lambda Function"
  value       = aws_lambda_function.count_visitors.version
}

output "lambda_function_last_modified" {
  description = "The date Lambda Function resource was last modified"
  value       = aws_lambda_function.count_visitors.last_modified
}

output "lambda_function_invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = aws_lambda_function.count_visitors.invoke_arn
}

output "lambda_function_memory_size" {
  description = "The amount of memory available to the function at runtime in MB"
  value       = aws_lambda_function.count_visitors.memory_size
}

output "aws_api_gateway_rest_api_id" {
  description = "The ID of the API Gateway REST API"
  value       = aws_apigatewayv2_api.visitors_count_api.id
}

output "aws_api_gateway_rest_api_name" {
  description = "The name of the API Gateway REST API"
  value       = aws_apigatewayv2_api.visitors_count_api.name
}

output "aws_api_gateway_rest_api_description" {
  description = "The description of the API Gateway REST API"
  value       = aws_apigatewayv2_api.visitors_count_api.description
}

output "aws_api_gateway_rest_api_endpoint" {
  description = "The endpoint of the API Gateway REST API"
  value       = aws_apigatewayv2_api.visitors_count_api.api_endpoint
}

output "aws_api_gateway_stage_id" {
  description = "The ID of the API Gateway Stage"
  value       = aws_apigatewayv2_stage.default.id
}

output "aws_api_gateway_stage_name" {
  description = "The name of the API Gateway Stage"
  value       = aws_apigatewayv2_stage.default.name
}

output "aws_api_gateway_stage_auto_deploy" {
  description = "Whether the API Gateway Stage is set to auto-deploy"
  value       = aws_apigatewayv2_stage.default.auto_deploy
}

output "aws_api_gateway_stage_description" {
  description = "The description of the API Gateway Stage"
  value       = aws_apigatewayv2_stage.default.description
}

output "aws_api_gateway_stage_deployment_id" {
  description = "The ID of the API Gateway Stage Deployment"
  value       = aws_apigatewayv2_stage.default.deployment_id
}

output "aws_api_gateway_stage_api_id" {
  description = "The ID of the API Gateway Stage API"
  value       = aws_apigatewayv2_stage.default.api_id
}

output "count_visitors_function_arn" {
  value = aws_lambda_function.count_visitors.arn
}

output "api_gateway_url" {
  value = aws_apigatewayv2_api.visitors_count_api.api_endpoint
}
