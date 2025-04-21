variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
}

variable "profile" {
  description = "The AWS profile to use for authentication"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 Bucket"
  type        = string
}

variable "app_path" {
  description = "Path to the application files"
  type        = string
  default     = "../app/website/"
}

variable "object_ownership" {
  description = "The object ownership setting for the S3 bucket"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "index_document" {
  description = "The index document for the S3 bucket"
  type        = string
}

variable "error_document" {
  description = "The error document for the S3 bucket"
  type        = string
}
