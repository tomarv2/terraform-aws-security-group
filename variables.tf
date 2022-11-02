variable "config" {
  description = "Security groups configuration"
  type        = any
  default     = {}
}

variable "extra_tags" {
  description = "Additional tags to associate"
  type        = map(string)
  default     = {}
}
#
#variable "security_group_ingress" {
#  description = "Can be specified multiple times for each ingress rule."
#  type = map(object({
#    description              = string
#    from_port                = number
#    protocol                 = string
#    type                     = string
#    to_port                  = number
#    self                     = bool
#    cidr_blocks              = list(string)
#    source_security_group_id = string
#  }))
#  default = {
#    default = {
#      description              = "NFS Inbound"
#      from_port                = 2049
#      protocol                 = "tcp"
#      type                     = "ingress"
#      to_port                  = 2049
#      self                     = true
#      cidr_blocks              = []
#      source_security_group_id = null
#    }
#  }
#}
#
#variable "security_group_egress" {
#  description = "Can be specified multiple times for each egress rule."
#  type = map(object({
#    description = string
#    from_port   = number
#    type        = string
#    protocol    = string
#    to_port     = number
#    self        = bool
#    cidr_blocks = list(string)
#  }))
#  default = {
#    default = {
#      description = "Allow All Outbound"
#      from_port   = 0
#      type        = "egress"
#      protocol    = "-1"
#      to_port     = 0
#      self        = false
#      cidr_blocks = ["0.0.0.0/0"]
#    }
#  }
#}
#
#variable "description" {
#  description = "Security group description"
#  default     = null
#  type        = string
#}
#
#variable "name" {
#  description = "Name of the security group"
#  default     = null
#  type        = string
#}

variable "security_group_create_timeout" {
  type        = string
  description = "How long to wait for the security group to be created."
  default     = "10m"
}

variable "security_group_delete_timeout" {
  type        = string
  description = <<-EOT
    How long to retry on `DependencyViolation` errors during security group deletion from
    lingering ENIs left by certain AWS services such as Elastic Load Balancing.
    EOT
  default     = "15m"
}