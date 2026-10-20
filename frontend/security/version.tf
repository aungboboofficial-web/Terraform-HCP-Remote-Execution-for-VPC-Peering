terraform {
  required_version = "~>1.16.0"

  cloud {
    
    organization = "cloud_infrastructure"

    workspaces {
      name = "fe-security-ws"
    }
  }
}

provider "aws" {
  region     = var.region
}