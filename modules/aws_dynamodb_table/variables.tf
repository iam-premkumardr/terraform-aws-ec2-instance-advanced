variable "select_name" {
  description = "value for the aws dynamodb table"
  type = map(string)
  default = {
    "dev" = "dev-terraform-state-lock"
    "stg" = "stg-terraform-state-lock"
    "prd" = "prd-terraform-state-lock"
  }
}

variable "selected_name_value" {
  description = "Key of the table from the map"
  type        = string
  default     = "dev"  # Default to "dev-terraform-state-lock"
}