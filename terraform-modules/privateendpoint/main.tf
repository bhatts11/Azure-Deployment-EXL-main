resource "azurerm_private_dns_zone" "webappdns" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.rg_Name
}

resource "azurerm_private_dns_zone" "storagedns" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.rg_Name
}

resource "azurerm_private_dns_zone" "private_zone_keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.rg_Name
}

#private DNS Link
resource "azurerm_private_dns_zone_virtual_network_link" "app_network_link" {
  name                  = var.appdnslink
  resource_group_name   = var.rg_Name
  private_dns_zone_name = azurerm_private_dns_zone.webappdns.name
  virtual_network_id    = var.private_endpoint_vnet_id
  registration_enabled  = false
}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_network_link" {
  name                  = var.storagedns
  resource_group_name   = var.rg_Name
  private_dns_zone_name = azurerm_private_dns_zone.storagedns.name
  virtual_network_id    = var.private_endpoint_vnet_id
  registration_enabled  = false
}

resource "azurerm_private_dns_zone_virtual_network_link" "keyvault_network_link" {
  name                  = var.keyvaultdns
  resource_group_name   = var.rg_Name
  private_dns_zone_name = azurerm_private_dns_zone.private_zone_keyvault.name
  virtual_network_id    = var.private_endpoint_vnet_id
  registration_enabled  = false
}

resource "azurerm_private_endpoint" "ditprivateendpoint" {
  name                = var.dit_private_endpoint_name
  location            = var.location
  resource_group_name = var.rg_Name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = var.privateconnectionditapp
    private_connection_resource_id = var.private_connectionditapp_id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = azurerm_private_dns_zone.webappdns.name
    private_dns_zone_ids = [azurerm_private_dns_zone.webappdns.id]
  }

}

resource "azurerm_private_endpoint" "diprivateendpoint" {
  name                = var.di_private_endpoint_name
  location            = var.location
  resource_group_name = var.rg_Name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags


  private_service_connection {
    name                           = var.privateconnectiondiapp
    private_connection_resource_id = var.private_connectiondiapp_id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = azurerm_private_dns_zone.webappdns.name
    private_dns_zone_ids = [azurerm_private_dns_zone.webappdns.id]
  }

}

resource "azurerm_private_endpoint" "storageprivateendpoint" {
  name                = var.st_acc_private_endpoint_name
  location            = var.location
  resource_group_name = var.rg_Name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags


  private_service_connection {
    name                           = var.storage_private_connection
    private_connection_resource_id = var.private_connection_strg_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = azurerm_private_dns_zone.storagedns.name
    private_dns_zone_ids = [azurerm_private_dns_zone.storagedns.id]
  }

}

resource "azurerm_private_endpoint" "keyvaultprivateendpoint" {
  name                = var.kv_private_endpoint_name
  location            = var.location
  resource_group_name = var.rg_Name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags


  private_service_connection {
    name                           = var.keyvault_private_connection
    private_connection_resource_id = var.private_connection_keyvault_id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = azurerm_private_dns_zone.private_zone_keyvault.name
    private_dns_zone_ids = [azurerm_private_dns_zone.private_zone_keyvault.id]
  }

}


#### Private Endpoint monitoring

resource "azurerm_monitor_diagnostic_setting" "ditprivateendpoint_diag" {
  name                       = var.dit_pe_diag_name
  target_resource_id         = azurerm_private_endpoint.ditprivateendpoint.network_interface[0].id # Error because it can't recognize
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = var.metric_retention_days
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diprivateendpoint_diag" {
  name                       = var.di_pe_diag_name
  target_resource_id         = azurerm_private_endpoint.diprivateendpoint.network_interface[0].id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = var.metric_retention_days
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "storageprivateendpoint_diag" {
  name                       = var.storage_pe_diag_name
  target_resource_id         = azurerm_private_endpoint.storageprivateendpoint.network_interface[0].id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = var.metric_retention_days
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "keyvaultprivateendpoint_diag" {
  name                       = var.keyvault_pe_diag_name
  target_resource_id         = azurerm_private_endpoint.keyvaultprivateendpoint.network_interface[0].id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = var.metric_retention_days
    }
  }
}