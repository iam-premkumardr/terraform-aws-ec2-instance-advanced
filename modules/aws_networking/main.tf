#Configure the aws provider
provider "aws" {
region = "ap-southeast-2"
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "my_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "my_rta" {
  count          = length(var.subnet_ids)
  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.my_rt.id
}
