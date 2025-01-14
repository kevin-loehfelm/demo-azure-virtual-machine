terraform {
  cloud {
    organization = "kloehfelm-demo"
    hostname     = "app.terraform.io"
    workspaces {
      project = "demo - terraform"
      name    = "biogen-demo"
    }
  }
  required_version = ">1.6.0" # BUSL
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0" # Dec 4 2025
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.101.0" # Jan 7 2025
    }
  }
}