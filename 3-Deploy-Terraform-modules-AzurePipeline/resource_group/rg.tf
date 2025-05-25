##############################################
# Resource Group Creation
##############################################

resource "azurerm_resource_group" "resource_group" {
    name = "${var.resource_group}-rg"
    location = var.resource_location
    
  
}