output "security_group_id" {
  description = "The ID of the default security group."
  value       = module.securitygroup.security_group_id
}

output "security_group_vpc_id" {
  description = "VPC id associated with security group."
  value       = module.securitygroup.security_group_vpc_id
}

output "security_group_arn" {
  description = "Security group arn."
  value       = module.securitygroup.security_group_arn
}