resource "aws_network_acl" "this" {
  vpc_id = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.env}-nacl"
  })
}

resource "aws_network_acl_rule" "inbound_http" {
  network_acl_id = aws_network_acl.this.id
  rule_number    = 100
  protocol       = "6"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  egress         = false
  rule_action    = "allow"
}

resource "aws_network_acl_rule" "inbound_ssh" {
  network_acl_id = aws_network_acl.this.id
  rule_number    = 110
  protocol       = "6"
  from_port      = 22
  to_port        = 22
  cidr_block     = "0.0.0.0/0"
  egress         = false
  rule_action    = "allow"
}

resource "aws_network_acl_rule" "outbound_all" {
  network_acl_id = aws_network_acl.this.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
