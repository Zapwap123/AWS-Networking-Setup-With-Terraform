module "vpc" {
  source   = "../../modules/vpc"
  env      = var.env
  vpc_cidr = var.vpc_cidr

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

module "public_subnet" {
  source      = "../../modules/subnet"
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = var.public_subnet_cidr
  az          = var.az

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

module "igw" {
  source = "../../modules/igw"
  vpc_id = module.vpc.vpc_id
  env    = var.env

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}
