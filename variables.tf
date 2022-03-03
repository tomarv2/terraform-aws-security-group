variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to create resources"
  type        = string
}

variable "deploy_security_group" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "security_group_ingress" {
  description = "Can be specified multiple times for each ingress rule."
  type = map(object({
    description = string
    from_port   = number
    protocol    = string
    type        = string
    to_port     = number
    self        = bool
    cidr_blocks = list(string)
  }))
  default = {
    default = {
      description = "NFS Inbound"
      from_port   = 2049
      protocol    = "tcp"
      type        = "ingress"
      to_port     = 2049
      self        = true
      cidr_blocks = []
    }
  }
}

variable "security_group_egress" {
  description = "Can be specified multiple times for each egress rule."
  type = map(object({
    description = string
    from_port   = number
    type        = string
    protocol    = string
    to_port     = number
    self        = bool
    cidr_blocks = list(string)
  }))
  default = {
    default = {
      description = "Allow All Outbound"
      from_port   = 0
      type        = "egress"
      protocol    = "-1"
      to_port     = 0
      self        = false
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "account_id" {
  description = "AWS account id to deploy resources"
  type        = string
}

variable "description" {
  description = "Security group description"
  default     = null
  type        = string
}

variable "name" {
  description = "Name of the security group"
  default     = null
  type        = string
}
