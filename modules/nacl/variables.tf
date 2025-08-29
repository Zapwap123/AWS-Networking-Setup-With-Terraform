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
