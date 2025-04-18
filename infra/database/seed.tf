# Initial seed data for the DynamoDB table
resource "aws_dynamodb_table_item" "seed_items" {
  count      = var.seed_items_count
  depends_on = [aws_dynamodb_table.visitors_count]
  table_name = aws_dynamodb_table.visitors_count.name
  hash_key   = "id"

  item = jsonencode({
    id = {
      S = "visitor_count"
    }
    visitors = {
      N = "0"
    }
  })
}
