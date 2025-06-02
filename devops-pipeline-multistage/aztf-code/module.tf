
terraform {
  required_version = ">= 0.13"
}

locals {
  application_name   = var.application_name
  environment_name   = var.environment_name
  resource_location  = var.resource_location
  virtual_network_name = "${var.application_name}-${var.environment_name}-vnet"
  resource_group_name      = "${var.application_name}-${var.environment_name}-rg"
}


module "resource_group" {
  source = "./resourceGroup"
  resource_group = local.resource_group_name
  resource_location = local.resource_location 
  

}

module "vnet" {
  source                      = "./virtual_network"
  resource_group              = module.resource_group
  resource_location           = var.resource_location

  virtual_network_name        = local.virtual_network_name
  network_address_space       = var.network_address_space
  subnet1_address_prefix      = var.subnet1_address_prefix
  subnet1_address_name        = "${local.virtual_network_name}-subnet1"
  subnet2_address_prefix      = var.subnet2_address_prefix
  subnet2_address_name        = "${local.virtual_network_name}-subnet2"

  depends_on = [
    module.resource_group
  ]
}