variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "The AWS profile to use for authentication"
  type        = string
  default     = "default"
}

variable "s3_bucket_name" {
  description = "Name of the S3 Bucket"
  type        = string
  default     = null
}

variable "app_path" {
  description = "Path to the application files"
  type        = string
  default     = "../app"
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