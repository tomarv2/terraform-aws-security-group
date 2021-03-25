variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
  default     = "default"
}

variable "aws_region" {
  description = "The AWS region to create resources"
  default     = "us-west-2"
}

variable "deploy_security_group" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "security_group_ingress" {
  description = "Can be specified multiple times for each ingress rule. "
  type = map(object({
    description = string
    from_port   = number
    protocol    = string
    to_port     = number
    self        = bool
    cidr_blocks = list(string)
  }))
  default = {
    default = {
      description = "NFS Inbound"
      from_port   = 2049
      protocol    = "tcp"
      to_port     = 2049
      self        = true
      cidr_blocks = []
    }
  }
}

variable "security_group_egress" {
  description = "Can be specified multiple times for each egress rule. "
  type = map(object({
    description = string
    from_port   = number
    protocol    = string
    to_port     = number
    self        = bool
    cidr_blocks = list(string)
  }))
  default = {
    default = {
      description = "Allow All Outbound"
      from_port   = 0
      protocol    = "-1"
      to_port     = 0
      self        = false
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "account_id" {}

variable "description" {
  default = null
}

variable "name" {
  default = null
}