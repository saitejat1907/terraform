
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

#public subnet
resource "azurerm_subnet" "tf-subnet" {
  name                 = "tf-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.tf-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}