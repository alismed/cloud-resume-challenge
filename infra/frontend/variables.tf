variable "s3_bucket_name" {
  description = "Name of the S3 Bucket"
  type        = string
  default     = null
}

variable "app_path" {
  description = "Path to the application files"
  type        = string
  default     = "../../app/website/"
}

variable "acl_type" {
  description = "The ACL type for the S3 bucket"
  type        = string
  default     = "public-read"
}

variable "object_ownership" {
  description = "The object ownership setting for the S3 bucket"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "index_document" {
  description = "The index document for the S3 bucket"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The error document for the S3 bucket"
  type        = string
  default     = "error.html"
}

