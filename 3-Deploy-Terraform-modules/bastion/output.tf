#########################################################################
## Azure Bastion Service Output Variables defined
#########################################################################
output "bastionhost_name" {
  value       = azurerm_bastion_host.bastion.name
  description = "Name of bastion host"
}
output "bastionhost_ip" {
  value       = azurerm_public_ip.pubip.ip_address
  description = "Bastion Host Ip address"
}