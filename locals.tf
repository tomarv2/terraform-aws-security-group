locals {
  account = data.aws_caller_identity.current.account_id
  region  = data.aws_region.current.name
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
