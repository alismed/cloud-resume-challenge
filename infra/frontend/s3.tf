module "common" {
  source = "../common"
}

resource "aws_s3_bucket" "static_website" {
  bucket = var.s3_bucket_name

  tags = merge(
    module.common.tags,
    {
      description = "Static Website Bucket"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "static_website_access_block" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "static_website_ownership_controls" {
  depends_on = [aws_s3_bucket_public_access_block.static_website_access_block]
  bucket     = aws_s3_bucket.static_website.id

  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_policy" "static_website_policy" {
  depends_on = [aws_s3_bucket_public_access_block.static_website_access_block]
  bucket     = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipal"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.static_website.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.main.arn
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "static_website_configuration" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

resource "aws_s3_object" "website_files" {
  for_each = fileset(var.app_path, "**/*")

  bucket       = aws_s3_bucket.static_website.id
  key          = each.value
  source       = "${var.app_path}/${each.value}"
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}
