resource "aws_security_group" "this" {
  count = var.deploy_security_group ? 1 : 0

  name       = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  description                     = var.description == null ? "Terraform managed: ${var.teamid}-${var.prjid}" : var.description
  vpc_id      = module.aws.vpc[var.account_id][var.aws_region]
  tags = merge(local.shared_tags)

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_security_group_rule" "this_ingress" {
  for_each          = var.security_group_ingress
  security_group_id = join("", aws_security_group.this.*.id)
  type              = "ingress"
  description       = lookup(each.value, "description", "Terraform managed: ${var.teamid}-${var.prjid}")
  from_port         = lookup(each.value, "from_port", null)
  protocol          = lookup(each.value, "protocol", null)
  to_port           = lookup(each.value, "to_port", null)
  self              = lookup(each.value, "self", null)
  cidr_blocks       = lookup(each.value, "cidr_blocks", null)
}

resource "aws_security_group_rule" "this_egress" {
  for_each          = var.security_group_egress
  security_group_id = join("", aws_security_group.this.*.id)
  type              = "egress"
  from_port         = lookup(each.value, "from_port", null)
  protocol          = lookup(each.value, "protocol", null)
  to_port           = lookup(each.value, "to_port", null)
  self              = lookup(each.value, "self", null)
  cidr_blocks       = lookup(each.value, "cidr_blocks", null)
}