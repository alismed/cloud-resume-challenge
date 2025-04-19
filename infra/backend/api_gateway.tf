resource "aws_apigatewayv2_api" "visitors_count_api" {
  name          = "visitors_count_api"
  protocol_type = "HTTP"
  description   = "API for counting visitors"

  cors_configuration {
      allow_credentials = false
      allow_headers     = []
      allow_methods     = [
          "GET",
          "OPTIONS",
          "POST",
      ]
      allow_origins     = [
          "*",
      ]
      expose_headers    = []
      max_age           = 0
  }

  tags = merge(
    module.common.tags,
    {
      description = "API for counting visitors"
    }
  )
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.visitors_count_api.id
  integration_method = "POST"
  integration_type = "AWS_PROXY"
  payload_format_version = "2.0"
  integration_uri  = aws_lambda_function.count_visitors.invoke_arn
}

resource "aws_apigatewayv2_route" "get_visitors" {
  api_id    = aws_apigatewayv2_api.visitors_count_api.id
  route_key = "GET /visitors_count"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.visitors_count_api.id
  name        = "$default"
  auto_deploy = true
}
