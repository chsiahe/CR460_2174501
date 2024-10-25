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
resource "azurerm_virtual_machine" "cr460" {
  name                  = "CR460-VM"
  location              = azurerm_resource_group.cr460.location
  resource_group_name   = azurerm_resource_group.cr460.name
  network_interface_ids = [azurerm_network_interface.cr460.id]
  vm_size               = "Standard_D4s_v3"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "cr460OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
