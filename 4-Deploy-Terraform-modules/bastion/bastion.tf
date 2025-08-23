###########################################################################
# Azure Bastion Service creation
# /* and */ are start and end delimiters for a comment that might span over multiple lines
###########################################################################

/*
Note :- Data source in terraform are used to get the information about resource extranl to Terraform and 
use them to set up your terraform resource 
*/
data "azurerm_resource_group" "resource_group" {
  name = "${var.resource_group}-rg"
  
}

/*
Use this data source to access the configuration of the AzureRM provider
*/

data "azurerm_client_config" "current" {}


data "azurerm_virtual_network" "virtual_network" {
    name = var.virtual_network_name
    resource_group_name = data.azurerm_resource_group.resource_group.name
  
}
###############################################################################
##Azure Bastion can only be created in subnet with name 'AzureBastionSubnet
###############################################################################
resource "azurerm_subnet" "bastion_subnet" {
  name                 = var.bastion_subnet_address_name
  resource_group_name  = data.azurerm_resource_group.bastion_resource_group.name
  virtual_network_name = data.azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.bastion_subnet_address_prefix
}



resource "azurerm_public_ip" "pubip" {
  name                = "${var.bastion_name}-PUBIP"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  allocation_method   = var.ip_allocation
  sku                 = var.sku

}

# create bastion host
resource "azurerm_bastion_host" "bastion" {
  name                = "${var.bastion_name}-host"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  tags                = var.bastion_tags


  ip_configuration {
    name                 = "${var.bastion_name}-configuration"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.pubip.id
  }

}