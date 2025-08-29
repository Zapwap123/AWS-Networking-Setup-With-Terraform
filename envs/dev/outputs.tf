output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.public_subnet.subnet_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "route_table_id" {
  value = module.route_table.route_table_id
}

output "security_group_id" {
  value = module.aws_security_group.security_group_id
}

output "nacl_id" {
  value = module.nacl.nacl_id
}
