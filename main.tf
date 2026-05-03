resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.resource_group_location
  tags = {
    name = "Hridoy Khan"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_storage_account" "st" {
  name                     = "tesings1335"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "development"
    name = "Hridoy Khan"
  }
}
