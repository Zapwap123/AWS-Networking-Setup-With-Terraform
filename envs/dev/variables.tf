variable "env" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "az" {
  description = "Availability Zone for the subnet"
  type        = string
}

variable "owner" {
  description = "Owner/team responsible for the environment"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "private_az" {
  description = "Availability Zone for the private subnet"
  type        = string
}
