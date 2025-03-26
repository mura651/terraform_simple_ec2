resource "aws_vpc" "this" {
enable_dns_hostnames = true
enable_dns_support = true
cidr_block = var.cidr_block
  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
    tags = {
        Name = "${var.name_prefix}-igw"
    } 
}

resource "aws_subnet" "this" {
    vpc_id = aws_vpc.this.id
    availability_zone = var.availability_zone
    cidr_block = var.public_subnet_cidr
    tags = {
        Name = "${var.name_prefix}-subnet-1a"
    }
}

resource "aws_route_table" "this" {
    vpc_id = aws_vpc.this.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.this.id
    }
    tags = {
        Name = "${var.name_prefix}-public-rt"
    }
}

resource "aws_route_table_association" "this" {
    subnet_id = aws_subnet.this.id
    route_table_id = aws_route_table.this.id
  
}

# locals {
#     name_prefix = "${var.app_name}-${var.env}"
# }