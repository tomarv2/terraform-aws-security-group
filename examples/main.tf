module "securitygroup" {
  source = "../"

  deploy_security_group = true

  email         = "demo@demo.com"
  service_ports = ["22", "80", "443", "5432", "8000"]
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
