# terraform required_providers setion is optional here
terraform {
  required_providers {
    azurerm = {
        sosource = "hashicorp/azurerm"
        versioversion = "=2.46.0"
    }
  }
}

provider "azurerm" {
    version = "=2.13.0"
    features {
      
    }
  
}
# backend azure storage account details 
terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "abcd1234"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

#Use this data source to access the configuration of the Azure Resource Manager provider.
data "azurerm_client_config" "current" {}


# below code for azure storage account details
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}