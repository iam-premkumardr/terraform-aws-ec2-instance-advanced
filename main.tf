#Call the module to create s3 bucket
module "s3" {
  source = "./modules/aws_s3_bucket"
  name = "allterraformstate202409281400" #change this value only lowercase alphanumeric characters
}

#Call the module to create dynamodb table
module "dynamodb_table_dev" {
  source = "./modules/aws_dynamodb_table"
  selected_name_value = "dev"  # This should match one of the keys in the select_name map
}

#Call the module to create dynamodb table
module "dynamodb_table_stg" {
  source = "./modules/aws_dynamodb_table"
  selected_name_value = "stg"  # This should match one of the keys in the select_name map
}


#Call the module to create dynamodb table
module "dynamodb_table_prd" {
  source = "./modules/aws_dynamodb_table"
  selected_name_value = "prd"  # This should match one of the keys in the select_name map
}
