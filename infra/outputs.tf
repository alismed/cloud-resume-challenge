output "s3_bucket_name" {
  value = aws_s3_bucket.static_website.bucket
}

output "s3_bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.static_website_configuration.website_endpoint
}

output "s3_bucket_id" {
  value = aws_s3_bucket.static_website.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.static_website.arn
}

output "website_url" {
  description = "URL do website"
  value       = "http://${aws_s3_bucket_website_configuration.static_website_configuration.website_endpoint}"
}