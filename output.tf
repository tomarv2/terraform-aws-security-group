output "security_group_id" {
  description = "The ID of the default security group."
  value       = join("", aws_security_group.default.*.id)
}

output "security_group_vpc_id" {
  description = "VPC id associated with security group."
  value       = join("", aws_security_group.default.*.vpc_id)
}

output "security_group_arn" {
  description = "Security group arn."
  value       = join("", aws_security_group.default.*.arn)
}