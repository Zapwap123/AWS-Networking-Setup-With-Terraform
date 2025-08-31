output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.public_subnet.subnet_id
}

output "private_subnet_id" {
  value = module.private_subnet.subnet_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "public_route_table_id" {
  value = module.public_route_table.route_table_id
}

output "private_route_table_id" {
  value = module.private_route_table.route_table_id
}

output "security_group_id" {
  value = module.aws_security_group.security_group_id
}

output "public_nacl_id" {
  value = module.public_nacl.nacl_id
}

output "private_nacl_id" {
  value = module.private_nacl.nacl_id
}
