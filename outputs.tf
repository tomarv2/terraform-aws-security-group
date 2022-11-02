output "id" {
  description = "The ID of the security group."
  value       = [for sg in aws_security_group.this : sg.id]
}

output "name" {
  description = "The name of the security group."
  value       = [for sg in aws_security_group.this : sg.name]
}


output "vpc_id" {
  description = "VPC id associated with security group."
  value       = [for sg in aws_security_group.this : sg.vpc_id]
}

output "arn" {
  description = "Security group ARN."
  value       = [for sg in aws_security_group.this : sg.arn]
}
