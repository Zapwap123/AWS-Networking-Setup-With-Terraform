variable "requester_vpc_id" {
  type        = string
  description = "VPC ID of the requester"
}

variable "accepter_vpc_id" {
  type        = string
  description = "VPC ID of the accepter"
}

variable "requester_region" {
  type        = string
  description = "Region of the requester VPC"
}

variable "accepter_region" {
  type        = string
  description = "Region of the accepter VPC"
}

variable "peering_name" {
  type        = string
  description = "Name tag for the VPC peering connection"
}
