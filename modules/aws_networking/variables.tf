variable "vpc_id" {
  description = "The ID of the VPC where the internet gateway and route table will be created"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the route table"
  type        = list(string)
}

variable "route_cidr_block" {
  description = "The CIDR block for the route"
  type        = string
  default     = "0.0.0.0/0"
}
