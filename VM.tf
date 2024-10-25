terraform {
  cloud {
    organization = "CR460_Cloud_Infra"

    workspaces {
      name = "CR460_AZURE"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.104.2"
    }
  }

  required_version = ">= 1.8.4"
}

provider "azurerm" {
  features {}
  subscription_id = "b8ee56be-3425-4ba0-9a55-18d26e4878c8"
  tenant_id       = "562cedd4-aaed-4e69-b6c4-e6bbcd1f8d2f"
  client_secret   = "2Wh8Q~Y2HP1KhKSA5zeWDHy.~3vN23i.SsjxCcea"
  client_id       = "1dedf67b-6e22-4ac5-ac69-784706926fdd"
}
  
resource "azurerm_resource_group" "cr460"{
  name     = "CR460-ResourceGroup"
  location = "(Africa) South Africa North"
}
