module "common" {
  source = "git::git@github.com:tomarv2/terraform-global.git//common?ref=v0.0.1"
}

module "aws" {
  source = "git::git@github.com:tomarv2/terraform-global.git//aws?ref=v0.0.1"
}

resource "aws_security_group" "this" {
  for_each = var.config

  name        = each.key
  description = try(each.value.description, "Terraform managed")
  vpc_id      = try(each.value.vpc_id, module.aws.vpc[local.account][local.region])
  tags        = merge(var.extra_tags, local.shared_tags)

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags,
    ]
  }

  dynamic "ingress" {
    for_each = [for i in try(each.value.all_ingress_rules, {}) : {
      description      = try(i.description, "Terraform managed")
      from_port        = i.from_port
      protocol         = i.protocol
      type             = try(i.type, "ingress")
      to_port          = i.to_port
      self             = try(i.self, true)
      cidr_blocks      = try(i.cidr_blocks, [])
      ipv6_cidr_blocks = try(i.value.ipv6_cidr_blocks, [])
      prefix_list_ids  = try(i.value.prefix_list_ids, [])
      security_groups  = try(i.value.security_groups, [])
    }]
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      description      = ingress.value.description
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      prefix_list_ids  = ingress.value.prefix_list_ids
      security_groups  = ingress.value.security_groups
      self             = ingress.value.self
    }
  }

  dynamic "egress" {
    for_each = [for i in try(each.value.all_egress_rules, {}) : {
      description      = try(i.description, "Terraform managed")
      from_port        = try(i.from_port, null)
      protocol         = try(i.protocol, null)
      type             = try(i.type, "egress")
      to_port          = try(i.to_port, null)
      self             = try(i.self, true)
      cidr_blocks      = try(i.cidr_blocks, [])
      ipv6_cidr_blocks = try(i.value.ipv6_cidr_blocks, [])
      prefix_list_ids  = try(i.value.prefix_list_ids, [])
      security_groups  = try(i.value.security_groups, [])
    }]
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      description      = egress.value.description
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      prefix_list_ids  = egress.value.prefix_list_ids
      security_groups  = egress.value.security_groups
      self             = egress.value.self
    }
  }

  timeouts {
    create = var.security_group_create_timeout
    delete = var.security_group_delete_timeout
  }
}



