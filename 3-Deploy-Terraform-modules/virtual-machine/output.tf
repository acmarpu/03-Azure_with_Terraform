output "jump_server_nic" {
    description = "id of the network interface"
    value = azurerm_network_interface.jump_server_nic.id
}



output "vm_public_ip" {
  value = azurerm_public_ip.jump_server_public_ip
}