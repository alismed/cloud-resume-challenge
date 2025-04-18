data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "../../app/lambda/"
  output_path = "../../app/lambda/target/app.zip"
}

resource "aws_iam_role" "countVisitors_role" {
  name               = "aws_resume_lamnbda_role"
  assume_role_policy = file("../trust/lambda-policy.json")
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
    var.tags,
    {
      description = "count the number of visitors"
    }
  )
}


