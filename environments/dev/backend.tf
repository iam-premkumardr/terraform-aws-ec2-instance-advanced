terraform {
  backend "s3" {
    bucket         = "allterraformstate202409281400" #change this value
    key            = "dev/terraform.tfstate" #The value must not start or end with "/"
    region         = "ap-southeast-2"
    dynamodb_table = "dev-terraform-state-lock"
    encrypt = true
  }
}
