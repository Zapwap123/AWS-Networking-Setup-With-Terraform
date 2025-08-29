resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.env}-public-rt"
  })

}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "subnet_assoc" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.this.id
}

