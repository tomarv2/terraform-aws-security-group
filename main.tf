module "common" {
  source = "git::git@github.com:tomarv2/terraform-global.git//common?ref=v0.0.1"
}

module "aws" {
  source = "git::git@github.com:tomarv2/terraform-global.git//aws?ref=v0.0.1"
}
