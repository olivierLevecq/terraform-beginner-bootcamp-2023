terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "random_string" "bucket_name" {
    length  = 32
    special = false
    lower   = true
    upper   = false
  }

output "random_bucket_name" {
  value = random_string.bucket_name.id
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.id
}