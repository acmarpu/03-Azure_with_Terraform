variable "project" {
  type = string
    description = "project name should mention here"
    default = "deployment"
  
}
variable "environment" {
  type        = string
  description = "environment name should mention here"
  default = "deployment"
}

variable "created" {
  type        = string
  description = "created name should mention here"
  default = "deployment"
  
}
variable "resource_group" {
    type = string
    description = "this for creating resource group"
    default = "deployment"
     
}

variable "resource_location" {
    type = string
    description = "this for creating module rg location"
    default = "centralindia"
    
  
}

## Virtual network details
variable "virtual_network_name" {
  type        = string
  description = "Virtual Network Name"
  default = "devlopment-vnet"
}
 
variable "network_address_space" {
  type    = list(any)
  description = "Virtual Network Address Space"
  default = ["10.0.0.0/16"]

}
 
variable "app_subnet_address_prefix" {
  type    = list(any)
  description = "app Subnet Address Prefix"
  default = ["10.0.1.0/24"]
  
  
} 
variable "app_subnet_address_name" {
  type        = string
  description = "app Subnet Name"
  default = "app_subnet"
}
 
variable "mangment_subnet_address_prefix" {
  type        = list(any)
  description = "mangment Subnet Address Prefix"
  default = ["10.0.2.0/24"]
}
 
variable "mangment_subnet_address_name" {
  type        = string
  description = "mangment Subnet Name"
  default = "mangment_subnet"
}

variable "database_subnet_address_prefix" {
  type        = list(any)
  description = "database Subnet Address Prefix"
  default = ["10.0.3.0/24"]
}
 
variable "database_subnet_address_name" {
  type        = string
  description = "database Subnet Name"
  default = "database_subnet"
}
 



## bastion host
##Azure Bastion can only be created in subnet with name 'AzureBastionSubnet
variable "bastion_name" {
  type        = string
  description = "Environment"
  default = "bastion"

}
variable "ip_allocation" {
    type        = string
    description = "bastion ip_allocation"
    default = "Static"
  
}

variable "sku" {
    type        = string
    description = "bastion ipsku_allocation"
    default = "Standard"
  
}

variable "bastion_subnet_address_prefix" {
  type    = list(any)
  description = "bastion Subnet Address Prefix"
  default = ["10.0.4.0/24"]
  
  
} 

variable "bastion_subnet_address_name" {
  type        = string
  description = "AzureBastionSubnet Subnet Name"
  default = "AzureBastionSubnet"
}



#virtual machine 

variable "jump-server-name" {
    description = "this is for private ip address"
    type = string
    default = "jump-server"
  
}


variable "public_ip_allocation_method" {
    description = "public ip"
    default = "Dynamic"
    type = string
  
}
## sku to be one of [Basic Standard]
variable "jump_server_public_ip_sku" {
    default = "Basic"
    description = "pub ip sku"
    type = string
  
}

variable "jump_server_public_ip_sku_tier" {
    default = "Regional"
    description = "sku tier"
    type = string
  
}

variable "enable_accelerated_networking" {
    default = "false"
    description = "networking"
    type = bool
  
}

variable "private_ip_address_allocation" {
    default = "Dynamic"
    description = "ip address allocation"
    type = string
  
}

variable "jump_server_name_size" {
    default = "Standard_DS1_v2"
    description = "name size"
    type = string
  
}

variable "caching" {
    default = "ReadWrite"
    description = "caching"
    
  
}

variable "storage_account_type" {
    default = "Standard_LRS"
    description = "storage account type"
    type = string
  
}

variable "source_image_publisher" {
    default = "Canonical"
    description = "image publisher"
    type = string
  
}
variable "source_image_offer" {
    default = "UbuntuServer"
    description = "image offer"
    type = string
  
}
variable "source_image_sku" {
    default = "18.04-LTS"
    description = "image sku"
    type = string
  
}
variable "source_image_version" {
    default = "latest"
    description = "image version"
    type = string
  
}
variable "admin_username" {
    default = "azureuser"
    description = "admin username"
    
  
}

variable "admin_password" {
    default = "Asdfgas@12345"
    description = "admin password"
    type = string
  
}

## At least one `admin_ssh_key` must be specified when `disable_password_authentication` is set to `true`
variable "disable_password_authentication" {
    default = "false"
    description = "password authentication"
    type = string
}

variable "jump_server_nic" {
  default = ""
  
  
}

variable "jump_server_public_ip" {
  default = ""
  
}





