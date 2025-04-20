variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
}

variable "profile" {
  description = "The AWS profile to use for authentication"
  type        = string
}

variable "seed_items_count" {
  description = "Number of items to seed in the DynamoDB table"
  type        = number
  default     = 1
}

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "Read capacity units"
  type        = number
  default     = 10
}

variable "write_capacity" {
  description = "Write capacity units"
  type        = number
  default     = 10
}
