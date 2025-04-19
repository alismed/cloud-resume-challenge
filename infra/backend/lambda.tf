module "common" {
  source = "../common"
}

data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "../app/lambda/src/"
  output_path = "../app/lambda/target/app.zip"
}

resource "aws_iam_role" "countVisitors_role" {
  name               = "aws_resume_lambda_role"
  assume_role_policy = file("./trust/lambda-policy.json")
}

resource "aws_lambda_function" "count_visitors" {
  function_name                  = var.lambda_function_name
  handler                        = var.handler
  runtime                        = var.lambda_runtime
  role                           = aws_iam_role.countVisitors_role.arn
  filename                       = var.zip_file
  memory_size                    = var.memory_size
  timeout                        = var.timeout

  environment {
    variables = {
      databaseName = "website_visitors"
    }
  }

  tags = merge(
    module.common.tags,
    {
      description = "count the number of visitors"
    }
  )
}

resource "aws_lambda_permission" "apigw_invoke" {
  depends_on    = [aws_lambda_function.count_visitors]
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.count_visitors.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.visitors_count_api.execution_arn}/*/*"
}
