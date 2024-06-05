# Provider configuration for Azure
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "terraform"
  location = "West Europe"
}

# VNet - Virtual Network
resource "azurerm_virtual_network" "tf-vnet" {
  name                = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = {
    Name = "tf-vnet"
  }
}
