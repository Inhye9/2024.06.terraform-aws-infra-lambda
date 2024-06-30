# ------------------------------------------------------------------------
# Nat Gateway
# ------------------------------------------------------------------------
resource "aws_nat_gateway" "anf_nat" {
  allocation_id = aws_eip.anf_eip.id
  subnet_id     = aws_subnet.anf_public_subnet_a.id

  # igw 생성 → eip, nat 생성
  depends_on = ["aws_internet_gateway.anf_igw"]

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-nat-gw"
  })
}

# elastic IP 생성
resource "aws_eip" "anf_eip" {
  vpc = true

  # igw 생성 → eip, nat 생성
  depends_on = ["aws_internet_gateway.anf_igw"]

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-eip"
  })
}