output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}

output "subnet2_id" {
  value = azurerm_subnet.subnet2.id
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