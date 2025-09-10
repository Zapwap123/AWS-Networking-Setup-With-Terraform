terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.0"
      configuration_aliases = [aws.requester, aws.accepter]
    }
  }
}

# Requester side (always created here)
resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.requester_vpc_id
  peer_vpc_id = var.accepter_vpc_id

  # Only set peer_region if requester and accepter regions differ
  peer_region = var.requester_region == var.accepter_region ? null : var.accepter_region

  auto_accept = var.requester_region == var.accepter_region

  tags = {
    Name = var.peering_name
  }

  provider = aws.requester
}

# Explicit accepter side (only for cross-region)
resource "aws_vpc_peering_connection_accepter" "this" {
  count = var.requester_region == var.accepter_region ? 0 : 1

  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }

  provider = aws.accepter
}

