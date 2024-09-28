#Configure the aws provider

provider "aws" {
region = "ap-southeast-2"
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
}