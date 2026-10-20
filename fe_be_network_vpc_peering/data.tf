data "tfe_outputs" "fe_network" {
  organization = "cloud_infrastructure"
  workspace    = "fe-network-ws"
}

data "tfe_outputs" "be_network" {
  organization = "cloud_infrastructure"
  workspace    = "be-network-ws"
}