data "tfe_outputs" "network" {
  organization = "cloud_infrastructure"
  workspace    = "be-network-ws"
}

data "tfe_outputs" "fe_security" {
  organization = "cloud_infrastructure"
  workspace    = "fe-security-ws"
}