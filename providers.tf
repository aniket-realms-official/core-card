terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region
  # access_key = "AKIATC4BRTUBBFJZFP7Y"
  # secret_key = "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"
}
