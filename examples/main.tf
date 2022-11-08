terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 4.35"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "security_group" {
  source = "../"

  config = {
    demo_1 = {
      all_ingress_rules = [
        {
          description = "https"
          type        = "ingress"
          from_port   = 443
          protocol    = "tcp"
          to_port     = 443
          self        = true
          cidr_blocks = []
        }
      ]
    }
    demo_2 = {
      all_ingress_rules = [
        {
          description = "http"
          type        = "ingress"
          from_port   = 80
          protocol    = "tcp"
          to_port     = 80
          self        = true
          cidr_blocks = []
        }
      ]
      all_egress_rules = [
        {
          description = "outbound traffic"
          from_port   = 0
          protocol    = "-1"
          type        = "egress"
          to_port     = 0
          self        = false
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}
