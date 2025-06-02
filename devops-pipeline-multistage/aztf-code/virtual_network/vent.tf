data "azurerm_resource_group" "resource_group" {
    
    name = var.resource_group.resource_group
 
}

 

# Use this data source to access the configuration of the AzureRM provider

data "azurerm_client_config" "current" {}


resource "azurerm_virtual_network" "virtual_network" {
  name = var.virtual_network_name
  location = var.resource_location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  address_space = var.network_address_space
 
}


# Creating subnets for above vnet

resource "azurerm_subnet" "subnet1" {
  name = var.subnet1_address_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes = var.subnet1_address_prefix
}

resource "azurerm_subnet" "subnet2" {
  name = var.subnet2_address_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes = var.subnet2_address_prefix
}

