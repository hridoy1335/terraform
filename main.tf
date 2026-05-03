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

  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "sb" {
  name                 = "st_subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]

  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_storage_account" "st" {
  name                     = "tesings1335"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.sb.id]
  }
  tags = {
    name = "Hridoy Khan"
  }

  depends_on = [ azurerm_subnet.sb ]
}

resource "azurerm_storage_container" "container" {
  for_each = var.container_name
  name                  = each.value
  storage_account_id    = azurerm_storage_account.st.id
  container_access_type = "private"
}

