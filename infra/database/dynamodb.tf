module "common" {
  source = "../common"
}

resource "aws_dynamodb_table" "visitors_count" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "visitors"
    type = "N"
  }

  global_secondary_index {
    name            = "visitors_count"
    hash_key        = "visitors"
    projection_type = "ALL"
    read_capacity   = 1
    write_capacity  = 1
  }

  tags = merge(
    module.common.tags,
    {
      description = "count the number of visitors"
    }
  )
}
/*
resource "aws_iam_role_policy_attachment" "dynamodb_role_policy_attachment" {
  depends_on = [aws_iam_role.dynamodb_role, aws_iam_policy.dynamodb_policy]
  role       = aws_iam_role.dynamodb_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}
*/