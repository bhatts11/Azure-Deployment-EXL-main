resource "azurerm_virtual_network" "wec_vnet" {
  name                = var.vnet_Name
  resource_group_name = var.rg_Name
  location            = var.location
  address_space       = [var.vnet_Address]
  tags                = var.tags
}

resource "azurerm_subnet" "subnet_pe" {
  name                                           = var.subnet_NameList[0]
  virtual_network_name                           = azurerm_virtual_network.wec_vnet.name
  resource_group_name                            = var.rg_Name
  address_prefixes                               = [var.subnet_AddressList[0]]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = true

}

resource "azurerm_subnet" "subnet_agw" {
  name                                           = var.subnet_NameList[1]
  virtual_network_name                           = azurerm_virtual_network.wec_vnet.name
  resource_group_name                            = var.rg_Name
  address_prefixes                               = [var.subnet_AddressList[1]]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = true
}


resource "azurerm_subnet" "subnet_azfw" {
  name                                           = var.subnet_NameList[2]
  virtual_network_name                           = azurerm_virtual_network.wec_vnet.name
  resource_group_name                            = var.rg_Name
  address_prefixes                               = [var.subnet_AddressList[2]]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = true

}


resource "azurerm_subnet" "subnet_gwsubnet" {
  name                                           = var.subnet_NameList[3]
  virtual_network_name                           = azurerm_virtual_network.wec_vnet.name
  resource_group_name                            = var.rg_Name
  address_prefixes                               = [var.subnet_AddressList[3]]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = true

}


resource "azurerm_subnet" "subnet_swiftconnec" {
  name                                           = var.subnet_NameList[4]
  virtual_network_name                           = azurerm_virtual_network.wec_vnet.name
  resource_group_name                            = var.rg_Name
  address_prefixes                               = [var.subnet_AddressList[4]]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = true
  delegation {
    name = "azure_function_delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "ds_vnet-lbdp-dev-centralus-01" {
  name                       = var.vnet_diag_name
  target_resource_id         = azurerm_virtual_network.wec_vnet.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "VMProtectionAlerts"
    enabled  = true

    retention_policy {
      enabled = true
      days    = var.log_retention_days
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = var.metric_retention_days
    }
  }


}