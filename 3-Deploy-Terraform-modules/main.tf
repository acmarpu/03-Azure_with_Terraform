module "resource_group" {
  source = "./resource_group"
  resource_group= var.resource_group
  resource_location = var.resource_location
            

}

module "vnet" {
  source                      = "./virtual_network"
  virtual_network_name      = var.virtual_network_name
  resource_group             = var.resource_group
  resource_location          = var.resource_location
  network_address_space       = var.network_address_space
  app_subnet_address_prefix   = var.app_subnet_address_prefix
  app_subnet_address_name     = var.app_subnet_address_name
  mangment_subnet_address_prefix = var.mangment_subnet_address_prefix
  mangment_subnet_address_name   = var.mangment_subnet_address_name
  database_subnet_address_prefix = var.database_subnet_address_prefix
  database_subnet_address_name   = var.database_subnet_address_name
  environment                    = var.environment

  depends_on = [
    module.resource_group
  ]
}




module "bation_module" {
  bastion_name        = var.bastion_name
  source                     = "./bastion"
  ip_allocation              = var.ip_allocation
  sku                        = var.sku
  environment                 = var.environment
  resource_group             = var.resource_group
  bastion_subnet_address_name   = var.bastion_subnet_address_name
  bastion_subnet_address_prefix = var.bastion_subnet_address_prefix
  virtual_network_name      = var.virtual_network_name
  
  bastion_tags = {
    env = "devlop"
  }

  depends_on = [
    module.resource_group,
    module.vnet
  ]

}

module "virtual-machine" {
    source = "./virtual-machine"    
    jump-server-name  = var.jump-server-name
    jump_server_nic = var.jump_server_nic
    resource_location = var.resource_location
    jump_server_name_size                = var.jump_server_name_size
    storage_account_type            = var.storage_account_type
    admin_username        = var.admin_username
    admin_password       = var.admin_password
    source_image_publisher         = var.source_image_publisher
    source_image_offer            = var.source_image_offer
    source_image_sku               = var.source_image_sku
    jump_server_public_ip       = var.jump_server_public_ip
    jump_server_public_ip_sku_tier = var.jump_server_public_ip_sku_tier
    enable_accelerated_networking = var.enable_accelerated_networking
    private_ip_address_allocation = var.private_ip_address_allocation
    source_image_version = var.source_image_version
    disable_password_authentication = var.disable_password_authentication
    virtual_network_name = var.virtual_network_name
    public_ip_allocation_method = var.public_ip_allocation_method
    caching = var.caching
    jump_server_public_ip_sku = var.jump_server_public_ip_sku
    resource_group = var.resource_group
    mangment_subnet_address_name = var.mangment_subnet_address_name
    

    depends_on = [
    module.resource_group,
    module.vnet
  ]
}

*/
