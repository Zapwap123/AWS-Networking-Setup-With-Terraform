terraform {
  backend "s3" {
    bucket       = "zeth-networking-terraform-states"
    key          = "networking/dev2/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
