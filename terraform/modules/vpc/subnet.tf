# ------------------------------------------------------------------------
# AZ(Available Zone)
# ------------------------------------------------------------------------
data "aws_availability_zones" "available" {}

# ------------------------------------------------------------------------
# Subnets
# ------------------------------------------------------------------------
resource "aws_subnet" "anf_public_subnet_a" {
  vpc_id     = aws_vpc.anf_vpc.id

  cidr_block = "10.54.1.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-public-subnet-a"
  })
}

resource "aws_subnet" "anf_public_subnet_b" {
  vpc_id     = aws_vpc.anf_vpc.id

  cidr_block = "10.54.2.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-public-subnet-b"
  })
}

resource "aws_subnet" "anf_private_subnet_a" {
  vpc_id     = aws_vpc.anf_vpc.id
  
  cidr_block = "10.54.10.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  
  tags = merge(local.common_tags, {
    Name = "${var.project_name}-private-subnet-a"
  })
}

resource "aws_subnet" "anf_private_subnet_b" {
  vpc_id     = aws_vpc.anf_vpc.id
  
  cidr_block = "10.54.11.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  
  tags = merge(local.common_tags, {
    Name = "${var.project_name}-private-subnet-b"
  })
}