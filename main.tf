terraform {
  cloud{
    organization = "OlivierL"
    workspaces {
      name = "terra-house-"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
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