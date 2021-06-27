provider "aws" {
  region  = "us-west-2"
  profile = "default"
}

module "common" {
  source = "git::git@github.com:tomarv2/terraform-global.git//common?ref=v0.0.1"
}

module "securitygroup" {
  source     = "../../"
  account_id = "123456789012"
  aws_region = "us-west-2"
  security_group_ingress = {
    default = {
      description = "https"
      type        = "ingress"
      from_port   = 443
      protocol    = "tcp"
      to_port     = 443
      self        = true
      cidr_blocks = []
    },
    ssh = {
      description = "ssh"
      from_port   = 22
      type        = "ingress"
      protocol    = "tcp"
      to_port     = 22
      self        = false
      cidr_blocks = module.common.cidr_for_sec_grp_access
    }
  }
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
