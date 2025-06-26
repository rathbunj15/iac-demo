resource "aws_vpc" "minikube_vpc" {
  cidr_block           = var.aws_vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "minikube-vpc"
  }
}

resource "aws_internet_gateway" "minikube_igw" {
  vpc_id = aws_vpc.minikube_vpc.id

  tags = {
    Name = "minikube-igw"
  }
}

# Subnets
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.minikube_vpc.id
  cidr_block              = var.aws_public_subnet_cidr_block
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

# Route Tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.minikube_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.minikube_igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Output Values
output "vpc_id" {
  value = aws_vpc.minikube_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}