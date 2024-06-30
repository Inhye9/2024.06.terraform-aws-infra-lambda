# ------------------------------------------------------------------------
# Internet Gateway
# ------------------------------------------------------------------------
resource "aws_internet_gateway" "anf_igw" {
  vpc_id = aws_vpc.anf_vpc.id

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-igw"
  })
}