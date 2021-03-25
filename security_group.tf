resource "aws_security_group" "default" {
  count = var.deploy_security_group ? 1 : 0

  name        = "${var.teamid}-${var.prjid}"
  description = "Terraform managed: ${var.teamid}-${var.prjid}"
  tags        = merge(local.shared_tags)
  lifecycle {
    create_before_destroy = true
  }
  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = module.common.cidr_for_sec_grp_access
      description = "Terraform managed: ${var.teamid}-${var.prjid}"
    }
  }
  # add security group to itself
  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    description = "Terraform managed: ${var.teamid}-${var.prjid}"
  }
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Terraform managed: ${var.teamid}-${var.prjid}"
  }

  revoke_rules_on_delete = true
}
