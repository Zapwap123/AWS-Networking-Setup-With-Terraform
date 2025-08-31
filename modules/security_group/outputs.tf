output "public_sg_id" {
  description = "Public security group ID"
  value       = module.sg.public_sg_id
}
output "private_sg_id" {
  description = "Private security group ID"
  value       = module.sg.private_sg_id
}
