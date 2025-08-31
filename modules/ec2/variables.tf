variable "name" {
  description = "Base name for the EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet where the EC2 instance will be launched"
  type        = string
}

variable "sg_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
  default     = []
}

variable "public_ip" {
  description = "Should the instance have a public IP?"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = null
}

variable "env" {
  description = "Environment (e.g., dev, staging, prod)"
  type        = string
}

variable "type" {
  description = "Instance type (e.g., public, private, app, db)"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the instance"
  type        = map(string)
  default     = {}
}
