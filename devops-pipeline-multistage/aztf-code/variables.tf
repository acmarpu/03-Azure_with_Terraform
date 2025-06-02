
variable "resource_location" {  
   
}

variable "application_name" {
  
}

variable "environment_name" {
  
}

# Vnet and Subnet
 
variable "network_address_space" {
  type    = list(any)
  

}
 
variable "subnet1_address_prefix" {
  type    = list(any)
  description = "app Subnet Address Prefix"
 
  
} 

variable "subnet1_address_name" {
  type        = string
  description = "app Subnet Name"
  
}
 
variable "subnet2_address_prefix" {
  type        = list(any)
  description = "mangment Subnet Address Prefix"
  
}
 
variable "subnet2_address_name" {
  type        = string
  description = "mangment Subnet Name"
  
}
