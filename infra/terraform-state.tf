terraform {
  backend "s3" {
    bucket  = "alismed-terraform"
    key     = "resume-challenge/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}