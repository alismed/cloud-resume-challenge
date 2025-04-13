terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = terraform.workspace == "default" ? null : var.profile
}