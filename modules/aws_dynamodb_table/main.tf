#Configure the aws provider
provider "aws" {
region = "ap-southeast-2"
}
#Configure the aws provider 
#ap-southeast-4 (Melbourne)
#ap-southeast-1 (Singapore)

resource "aws_dynamodb_table" "my_dynamodb_table" {
  name             =  var.select_name[var.selected_name_value]
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "LockID"
    type = "S"
  }
}