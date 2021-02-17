output "securitygroup_id" {
  description = "The ID of the default security group associated with the ECS container instances."
  value = module.securitygroup.security_group_id
}
