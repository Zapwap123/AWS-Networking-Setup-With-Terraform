variable "env" {
  description = "The environment for the subnet"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the subnet will be created"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "az" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "public" {
  description = "Whether the subnet is public or private"
  type        = bool
  default     = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
