output "security_group_id" {
  description = "The ID of the default security group."
  value       = module.security_group.id
}

output "security_group_vpc_id" {
  description = "VPC id associated with security group."
  value       = module.security_group.vpc_id
}

output "security_group_arn" {
  description = "Security group ARN."
  value       = module.security_group.arn
}
