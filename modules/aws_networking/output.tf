output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.my_igw.id
}

output "route_table_id" {
  description = "The ID of the Route Table"
  value       = aws_route_table.my_rt.id
}
