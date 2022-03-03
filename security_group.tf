resource "aws_security_group" "default" {
  count = var.deploy_security_group ? 1 : 0

  name        = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  description = var.description == null ? "Terraform managed: ${var.teamid}-${var.prjid}" : var.description
  vpc_id      = module.aws.vpc[local.account][local.region]
  tags        = var.custom_tags != null ? merge(var.custom_tags, local.shared_tags) : merge(local.shared_tags)


  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_security_group_rule" "default" {
  for_each = var.deploy_security_group ? var.security_group_ingress : {}

  security_group_id = join("", aws_security_group.default.*.id)
  type              = each.value.type
  description       = lookup(each.value, "description", "Terraform managed: ${var.teamid}-${var.prjid}")
  from_port         = lookup(each.value, "from_port", null)
  protocol          = lookup(each.value, "protocol", null)
  to_port           = lookup(each.value, "to_port", null)
  self              = coalesce(lookup(each.value, "self", null), false) ? true : null
  cidr_blocks       = try(length(lookup(each.value, "cidr_blocks", [])), 0) > 0 ? each.value["cidr_blocks"] : null
}

resource "aws_security_group_rule" "default_egress" {
  for_each = var.deploy_security_group ? var.security_group_egress : {}

  security_group_id = join("", aws_security_group.default.*.id)
  description       = lookup(each.value, "description", "Terraform managed: ${var.teamid}-${var.prjid}")
  type              = "egress"
  from_port         = lookup(each.value, "from_port", null)
  protocol          = lookup(each.value, "protocol", null)
  to_port           = lookup(each.value, "to_port", null)
  self              = coalesce(lookup(each.value, "self", null), false) ? true : null
  cidr_blocks       = try(length(lookup(each.value, "cidr_blocks", [])), 0) > 0 ? each.value["cidr_blocks"] : null
}
