# Creation of VPC
resource "aws_vpc" "testvpc" {
  cidr_block = var.vpc_cidr

  tags = {
    name = var.vpc_name
  }
}

# Creation of Public Subnet
resource "aws_subnet" "pubsubnet" {
  vpc_id                  = aws_vpc.testvpc.id
  cidr_block              = var.pubsubnet_cidr
  map_public_ip_on_launch = true
}

# Creation of Internet Gateway
resource "aws_internet_gateway" "testinternetgateway" {
  vpc_id = aws_vpc.testvpc.id
}

# Creation of Routetable (Internet Access)
resource "aws_route_table" "testroutetable" {
  vpc_id = aws_vpc.testvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testinternetgateway.id
  }
}

# Subnet Association
resource "aws_route_table_association" "routetableassociation" {
  subnet_id      = aws_subnet.pubsubnet.id
  route_table_id = aws_route_table.testroutetable.id
}