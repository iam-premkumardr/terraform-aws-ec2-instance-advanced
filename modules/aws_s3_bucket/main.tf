#Configure the aws provider
provider "aws" {
region = "ap-southeast-2"
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.name
}