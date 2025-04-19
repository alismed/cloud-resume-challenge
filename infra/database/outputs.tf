output "dynamodb_table_id" {
  description = "DynamoDB table ID"
  value       = aws_dynamodb_table.visitors_count.id
}

output "visitors_table_arn" {
  value = aws_dynamodb_table.visitors_count.arn
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.visitors_count.name
}

output "dynamodb_table_hash_key" {
  description = "DynamoDB table hash key"
  value       = aws_dynamodb_table.visitors_count.hash_key
}

output "dynamodb_table_range_key" {
  description = "DynamoDB table range key"
  value       = aws_dynamodb_table.visitors_count.range_key
}

output "dynamodb_table_secondary_index" {
  description = "DynamoDB table range key"
  value       = aws_dynamodb_table.visitors_count.global_secondary_index
}

output "seeded_items_count" {
  description = "Number of items seeded in the DynamoDB table"
  value       = length(aws_dynamodb_table_item.seed_items)
}

output "seeded_items" {
  description = "Items seeded in the DynamoDB table"
  value       = aws_dynamodb_table_item.seed_items
}