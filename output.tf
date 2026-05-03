output "resource_group_name"{
    value = azurerm_resource_group.rg.name
}
output "st_id" {
  value = azurerm_storage_account.st.id
  sensitive = false
}
output "container" {
  value = [ for i in azurerm_storage_container.container: i.name]
}