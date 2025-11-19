output "security_group_id" {
  value = aws_security_group.main.id
  description = "ID of the created security group"
}