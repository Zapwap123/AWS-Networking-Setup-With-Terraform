resource "aws_network_acl" "this" {
  vpc_id = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.env}-${var.type}-nacl"
  })
}

# Public NACL - HTTP Allowed
resource "aws_network_acl_rule" "inbound_http" {
  count          = var.type == "public" ? 1 : 0
  network_acl_id = aws_network_acl.this.id
  rule_number    = 100
  protocol       = "6"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  egress         = false
  rule_action    = "allow"
}

# Public NACL - SSH allowed
resource "aws_network_acl_rule" "inbound_ssh" {
  count          = var.type == "public" ? 1 : 0
  network_acl_id = aws_network_acl.this.id
  rule_number    = 110
  protocol       = "6"
  from_port      = 22
  to_port        = 22
  cidr_block     = "0.0.0.0/0"
  egress         = false
  rule_action    = "allow"
}

# Private NACL - Allow only internal VPC traffic
resource "aws_network_acl_rule" "inbound_internal" {
  count          = var.type == "private" ? 1 : 0
  network_acl_id = aws_network_acl.this.id
  rule_number    = 100
  protocol       = "-1"
  cidr_block     = var.vpc_cidr
  egress         = false
  rule_action    = "allow"
}

# Outbound rule - allow all
resource "aws_network_acl_rule" "outbound_all" {
  network_acl_id = aws_network_acl.this.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

# Associate the NACL with the subnet
resource "aws_network_acl_association" "this" {
  subnet_id      = var.subnet_id
  network_acl_id = aws_network_acl.this.id
}
