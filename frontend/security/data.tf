data "tfe_outputs" "network" {
  organization = "cloud_infrastructure"
  workspace    = "fe-network-ws"
}
data "tfe_outputs" "be_security" {
  organization = "cloud_infrastructure"
  workspace    = "be-security-ws"
}