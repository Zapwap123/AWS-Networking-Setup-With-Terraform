# The project VPC
module "vpc" {
  source   = "../../modules/vpc"
  env      = var.env
  vpc_cidr = var.vpc_cidr

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

# The public subnet
module "public_subnet" {
  source      = "../../modules/subnet"
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = var.public_subnet_cidr
  az          = var.az
  public      = true

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

# The Internet Gateway to allow internet access
module "igw" {
  source = "../../modules/igw"
  vpc_id = module.vpc.vpc_id
  env    = var.env

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

# The route table for the public subnet
module "public_route_table" {
  source    = "../../modules/route_table"
  vpc_id    = module.vpc.vpc_id
  env       = var.env
  subnet_id = module.public_subnet.subnet_id
  igw_id    = module.igw.igw_id
  type      = "public"

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

# The Security Group
module "aws_security_group" {
  source = "../../modules/security_group"
  vpc_id = module.vpc.vpc_id
  env    = var.env

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

# The private subnet
module "private_subnet" {
  source      = "../../modules/subnet"
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = var.private_subnet_cidr
  az          = var.private_az
  public      = false

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

# The Network ACL for the Public Subnet
module "public_nacl" {
  source    = "../../modules/nacl"
  vpc_id    = module.vpc.vpc_id
  env       = var.env
  type      = "public"
  vpc_cidr  = var.vpc_cidr
  subnet_id = module.public_subnet.subnet_id

  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}

# The Network ACL for the Private Subnet
module "private_nacl" {
  source    = "../../modules/nacl"
  vpc_id    = module.vpc.vpc_id
  env       = var.env
  type      = "private"
  vpc_cidr  = var.vpc_cidr
  subnet_id = module.private_subnet.subnet_id

  tags = {
    Environment = var.env
    Owner       = var.owner
  }

}

# Private Route Table
module "private_route_table" {
  source    = "../../modules/route_table"
  vpc_id    = module.vpc.vpc_id
  env       = var.env
  subnet_id = module.private_subnet.subnet_id
  type      = "private"
  tags = {
    Environment = var.env
    Owner       = var.owner
  }
}
