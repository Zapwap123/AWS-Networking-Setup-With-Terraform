terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.requester_region
  alias  = "requester"
}

provider "aws" {
  region = var.accepter_region
  alias  = "accepter"
}
