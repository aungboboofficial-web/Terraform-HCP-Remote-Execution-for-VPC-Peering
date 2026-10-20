terraform {
  required_version = "~>1.16.0"

  cloud {
    
    organization = "cloud_infrastructure"

    workspaces {
      name = "be-compute-ws"
    }
  }
}

provider "aws" {
  region     = var.region
}