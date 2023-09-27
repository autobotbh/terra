terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "bhbucket203"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIASLJTGKHFM2IB5VBU"
  secret_key = "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"
}
