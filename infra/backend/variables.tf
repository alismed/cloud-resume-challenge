variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
}

variable "profile" {
  description = "The AWS profile to use for authentication"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "zip_file" {
  description = "The path to the zip file containing the Lambda function code"
  type        = string
  default     = "../app/lambda/target/app.zip"
}

variable "memory_size" {
  description = "The amount of memory allocated to the Lambda function (in MB)"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "The timeout for the Lambda function (in seconds)"
  type        = number
  default     = 3
}

variable "handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "index.lambda_handler"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  type        = string
}

variable "visitors_table_arn" {
  description = "fom database module, DynamoDB table ARN"
  type        = string
}