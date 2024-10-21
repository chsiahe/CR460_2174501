terraform {
    required_version = "~> 1.6"
    required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  cloud {
    organization = "CR460_Cloud_Infra"
    workspaces {
      name = "CR460_AZURE"
    }
  }
}