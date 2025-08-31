output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP of the instance (if assigned)"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP of the instance"
}
