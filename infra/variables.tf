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

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "production"
    Project     = "cloud resume challenge"
  }
}
