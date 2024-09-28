variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created."
  type        = string
}

variable "cidr_block" {
   default = "10.0.1.0/24"
   description = "value for the cidr block subnet"
}

variable "availability_zone" {
  description = "The availability zone to create the subnet in"
  type        = string
}
