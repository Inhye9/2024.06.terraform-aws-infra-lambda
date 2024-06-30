# ------------------------------------------------------------------------
# Default Route Table
# ------------------------------------------------------------------------
resource "aws_default_route_table" "anf_default_rt" {
  default_route_table_id = "${aws_vpc.anf_vpc.default_route_table_id}"

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-default-rt"
  })
}

# ------------------------------------------------------------------------
# Public Route Table
# ------------------------------------------------------------------------
resource "aws_route_table" "anf_public_rt" {
  vpc_id = aws_vpc.anf_vpc.id

  # route rule add 
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.anf_igw.id
#   }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-public-rt"
  })
}

resource "aws_route" "anf_public_route" {
  route_table_id         = aws_route_table.anf_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.anf_igw.id
}

resource "aws_route_table_association" "anf_public_rt_assoc_1" {
  subnet_id      = aws_subnet.anf_public_subnet_a.id
  route_table_id = aws_route_table.anf_public_rt.id
}

# ------------------------------------------------------------------------
# Private Route Table
# ------------------------------------------------------------------------
resource "aws_route_table" "anf_private_rt" {
  vpc_id = aws_vpc.anf_vpc.id

  # route rule add 
#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.anf_nat.id
#   }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-private-rt"
  })
}

resource "aws_route" "anf_private_route" {
  route_table_id         = aws_route_table.anf_private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.anf_nat.id
}

resource "aws_route_table_association" "anf_private_rt_assoc_1" {
  subnet_id      = aws_subnet.anf_private_subnet_a.id
  route_table_id = aws_route_table.anf_private_rt.id
}
