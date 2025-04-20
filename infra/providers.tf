terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = terraform.workspace == "default" ? null : var.profile
}