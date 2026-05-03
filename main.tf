resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.resource_group_location
  tags = {
    name = "Hridoy Khan"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_prefix
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
