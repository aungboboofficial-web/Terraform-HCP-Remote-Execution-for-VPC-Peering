data "tfe_outputs" "network" {
  organization = "cloud_infrastructure"
  workspace    = "be-network-ws"
}

data "tfe_outputs" "security" {
  organization = "cloud_infrastructure"
  workspace    = "be-security-ws"
}

