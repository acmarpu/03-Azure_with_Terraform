
################################################################
# Virtual Network Creation
#################################################################


################################################################
# Mentioned resource group fetched from @ Resource Group folder
#################################################################
data "azurerm_resource_group" "resource_group" {
  name = "${var.resource_group}-rg"
  
}

/*
Use this data source to access the configuration of the AzureRM provider
*/
data "azurerm_client_config" "current" {}


resource "azurerm_virtual_network" "virtual_network" {
  name = var.virtual_network_name
  location = var.resource_location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  address_space = var.network_address_space
 
}

##################################################################################
# Creating subnets for Vent
##################################################################################
resource "azurerm_subnet" "app_subnet" {
  name = var.app_subnet_address_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes = var.app_subnet_address_prefix
}

resource "azurerm_subnet" "mangment_subnet" {
  name = var.mangment_subnet_address_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes = var.mangment_subnet_address_prefix
}

resource "azurerm_subnet" "database_subnet" {
  name = var.database_subnet_address_name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes = var.database_subnet_address_prefix
}