module "common" {
  source = "./common"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}

provider "aws" {
  region  = module.common.region
  profile = terraform.workspace == "default" ? null : module.common.profile
}