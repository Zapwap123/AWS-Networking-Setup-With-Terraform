variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "owner" {
  description = "Owner/team responsible for the environment"
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
  description = "Availability Zone for the public subnet"
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

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "tags" {
  description = "Additional resource tags"
  type        = map(string)
  default     = {}
}
