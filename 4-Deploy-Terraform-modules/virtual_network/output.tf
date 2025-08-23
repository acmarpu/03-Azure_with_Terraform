output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}


output "database_subnet_id" {
  value = azurerm_subnet.database_subnet.id
}

output "mangment_subnet_id" {
  value = azurerm_subnet.mangment_subnet.id
}

output "vnet_id" {
  value = azurerm_virtual_network.virtual_network.id
}
 
output "vnet_name" {
  value = azurerm_virtual_network.virtual_network.name
}
 
output "resource_group" {
  value = data.azurerm_resource_group.resource_group.name
}
 
output "resource_group_id" {
  value = data.azurerm_resource_group.resource_group.id
}

