resource "aws_subnet" "this" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = var.public

  availability_zone = var.az

  tags = merge(var.tags, {
    Name = "${var.env}-${var.public ? "public" : "private"}-subnet"
  })
}
