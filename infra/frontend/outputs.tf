output "s3_bucket_name" {
  value = aws_s3_bucket.static_website.bucket
}

output "s3_bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.static_website_configuration.website_endpoint
}

output "s3_bucket_id" {
  value = aws_s3_bucket.static_website.id
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.main.id
}

output "cloudfront_distribution_arn" {
  value = aws_cloudfront_distribution.main.arn
}

output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.main.domain_name
}

output "cloudfront_url" {
  value = "https://${aws_cloudfront_distribution.main.domain_name}"
}

output "s3_bucket_website_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.static_website.arn
}
