terraform {
  required_version            = ">= 0.12"
  required_providers {
    aws = {
      version                     = "~> 2.61"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  profile                     = var.profile_to_use
}

module "common" {
    source                    = "git::git@github.com:tomarv2/terraform-global.git"
}

locals {
  shared_tags  = map(
      "Name", "${var.teamid}-${var.prjid}",
      "Owner", var.email,
      "Team", var.teamid,
      "Project", var.prjid
  )
}
