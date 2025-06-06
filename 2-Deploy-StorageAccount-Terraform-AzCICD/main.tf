terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.60.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}


# backend azure storage account details 
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "StorageAccount-ResourceGroup"
#     storage_account_name = "abcd1234"
#     container_name       = "tfstate"
#     key                  = "prod.terraform.tfstate"
#   }
# }

#Use this data source to access the configuration of the Azure Resource Manager provider.
# data "azurerm_client_config" "current" {}


# below code for azure storage account details
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "eastus2"
}

resource "azurerm_storage_account" "example" {
  name                     = "stg2jai"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}