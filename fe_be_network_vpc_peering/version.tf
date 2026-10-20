terraform {
  required_version = "~>1.16.0"

  cloud {
    
    organization = "cloud_infrastructure"

    workspaces {
      name = "fe_be_vpc_peering"
    }
  }
}
provider "aws" {
  region     = var.region
}