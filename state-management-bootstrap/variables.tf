variable "bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
}

variable "region" {
  description = "The AWS region for the bucket"
  type        = string
  default     = "us-east-1"
}
