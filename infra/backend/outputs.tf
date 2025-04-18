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
