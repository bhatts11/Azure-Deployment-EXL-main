output "vnet_Name" {
  value = azurerm_virtual_network.wec_vnet.name
}
output "vnet_Address" {
  value = azurerm_virtual_network.wec_vnet.address_space
}
output "vnet_Id" {
  value = azurerm_virtual_network.wec_vnet.id
}



output "subnet_pe_name" {
  value = azurerm_subnet.subnet_pe.name
}
output "subnet_pe_Id" {
  value = azurerm_subnet.subnet_pe.id
}
output "subnet_pe_CIDRAddress" {
  value = azurerm_subnet.subnet_pe.address_prefixes
}

output "subnet_agw_name" {
  value = azurerm_subnet.subnet_agw.name
}
output "subnet_agw_Id" {
  value = azurerm_subnet.subnet_agw.id
}
output "subnet_agw_CIDRAddress" {
  value = azurerm_subnet.subnet_agw.address_prefixes
}

output "subnet_azfw_name" {
  value = azurerm_subnet.subnet_azfw.name
}
output "subnet_azfw_Id" {
  value = azurerm_subnet.subnet_azfw.id
}
output "subnet_azfw_CIDRAddress" {
  value = azurerm_subnet.subnet_azfw.address_prefixes
}

output "subnet_gwsubnet_name" {
  value = azurerm_subnet.subnet_gwsubnet.name
}
output "subnet_gwsubnet_Id" {
  value = azurerm_subnet.subnet_gwsubnet.id
}
output "subnet_gwsubnet_CIDRAddress" {
  value = azurerm_subnet.subnet_gwsubnet.address_prefixes
}

output "subnet_swiftconnec_name" {
  value = azurerm_subnet.subnet_swiftconnec.name
}
output "subnet_swiftconnec_Id" {
  value = azurerm_subnet.subnet_swiftconnec.id
}
output "subnet_swiftconnec_CIDRAddress" {
  value = azurerm_subnet.subnet_swiftconnec.address_prefixes
}

