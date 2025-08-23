#################################################################
# Virtual Machine creation
################################################################

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
    name  = var.virtual_network_name
    resource_group_name = data.azurerm_resource_group.resource_group.name
  
}

data "azurerm_subnet" "jump_server_subnet" {
    name = var.mangment_subnet_address_name
    resource_group_name = data.azurerm_resource_group.resource_group.name
    virtual_network_name = data.azurerm_virtual_network.virtual_network.name
  
}

#########################################
# Public IP creation
#########################################
resource "azurerm_public_ip" "jump_server_public_ip" {
  name    = "${var.jump-server-name}-public_ip"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  allocation_method   = var.public_ip_allocation_method
  sku = var.jump_server_public_ip_sku
  sku_tier = var.jump_server_public_ip_sku_tier
}

#########################################
# Network Security Grop and rules creation
#########################################
resource "azurerm_network_security_group" "jump_server_nsg" {
  name                = "${var.jump-server-name}-nsg"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#########################################
# NIC creation
#########################################
resource "azurerm_network_interface" "jump_server_nic" {
  name                = "${var.jump-server-name}-nic"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  enable_accelerated_networking = var.enable_accelerated_networking

  ip_configuration {
    name                          = "${var.jump-server-name}-configuration"
    subnet_id                     = data.azurerm_subnet.jump_server_subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.jump_server_public_ip.id
  }
}

###########################################################
# Connect the security group to the network interface
###########################################################
resource "azurerm_network_interface_security_group_association" "jump_server_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.jump_server_nic.id
  network_security_group_id = azurerm_network_security_group.jump_server_nsg.id
}

resource "azurerm_linux_virtual_machine" "jump_server_name" {
  name                = var.jump-server-name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  network_interface_ids = [azurerm_network_interface.jump_server_nic.id]
  size                  = var.jump_server_name_size

  os_disk {
    name                 = "${var.jump-server-name}-OS_Disk"
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }

  computer_name                   = "${var.jump-server-name}"
  admin_username                  = var.admin_username
  admin_password                  =  var.admin_password            
  disable_password_authentication =  var.disable_password_authentication

  
  
}
