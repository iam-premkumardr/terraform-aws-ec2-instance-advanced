#Configure the aws provider
provider "aws" {
region = "ap-southeast-2"
}


resource "aws_security_group" "my_security_group" {
  name   = var.name
  vpc_id = var.vpc_id

  # Ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value["description"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  # Egress rules
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value["description"]
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }
}
