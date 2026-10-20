data "tfe_outputs" "network" {
  organization = "cloud_infrastructure"
  workspace    = "fe-network-ws"
}

data "tfe_outputs" "security" {
  organization = "cloud_infrastructure"
  workspace    = "fe-security-ws"
}

