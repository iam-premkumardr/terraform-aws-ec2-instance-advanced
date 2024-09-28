terraform {
  backend "s3" {
    bucket         = "allterraformstate202409281400" #change this value
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "stg-terraform-state-lock"
  }
}
