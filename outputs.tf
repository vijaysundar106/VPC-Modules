# Output for VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.testvpc.id
}

# Output CIDR block of VPC
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.testvpc.cidr_block
}

# Output for Public Subnet
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.pubsubnet.id
}

# Output for Internet Gateway
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.testinternetgateway.id
}

# Output for Route Table
output "route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.testroutetable.id
}
