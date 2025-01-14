terraform {
  required_version = ">1.6.0" # BUSL
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0" # Jan 3 2025
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2" # Jan 3 2025
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.62.0" # Jan 3 2025
    }
    time = {
      source  = "hashicorp/time"
      version = "0.12.1" # Jan 10 2025
    }
  }
}