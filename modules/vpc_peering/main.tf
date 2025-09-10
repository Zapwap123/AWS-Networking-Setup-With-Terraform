# VPC peering request (always created from requester side)
resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.requester_vpc_id
  peer_vpc_id = var.accepter_vpc_id
  peer_region = var.accepter_region

  # Auto accept only if same region
  auto_accept = var.requester_region == var.accepter_region ? true : false

  tags = {
    Name = var.peering_name
  }

  provider = aws.requester
}

# Explicit accepter resource (needed for cross-region or cross-account)
resource "aws_vpc_peering_connection_accepter" "this" {
  count = var.requester_region == var.accepter_region ? 0 : 1

  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }

  provider = aws.accepter
}
