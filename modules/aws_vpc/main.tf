#Configure the aws provider

provider "aws" {
region = "ap-southeast-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
}
