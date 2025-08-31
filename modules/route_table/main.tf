# Create a Route Table
resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.env}-${var.type}-rt"
  })
}

resource "aws_route" "default_route" {
  count = var.type == "public" ? 1 : 0

  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

# Associates to a Subnet
resource "aws_route_table_association" "subnet_assoc" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.this.id
}
