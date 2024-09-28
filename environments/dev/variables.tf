variable "environment" {
  description = "The environment for which we're deploying (e.g. dev, stg, prd)"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-2"
}
