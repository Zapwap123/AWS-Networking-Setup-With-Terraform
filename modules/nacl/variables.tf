variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "env" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

# Allow switching between public and private NACL
variable "type" {
  type    = string
  default = "public"
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}
