variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "role_name" {
  description = "The name of the IAM role for GitHub Actions"
  type        = string
  default     = "github-actions-terraform"
}
