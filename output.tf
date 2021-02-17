output "security_group_id" {
  description = "The ID of the default security group associated with the ECS container instances."
  value = aws_security_group.default.id
}
