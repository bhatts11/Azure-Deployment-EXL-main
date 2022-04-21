data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = var.keyvalut_Name
  resource_group_name = var.rg_Name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.keyvalut_SKU
  tags                = var.tags
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions         = ["Get", "Update", "List", "Create"]
    secret_permissions      = ["Get", "List", "Set", "Delete"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import"]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

}

resource "azurerm_key_vault_access_policy" "kv_di_access" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.kv_access_di_objid

  secret_permissions = [
    "Get",
    "List",
  ]
}


resource "azurerm_key_vault_access_policy" "kv_dit_access" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.kv_access_dit_objid

  secret_permissions = [
    "Get",
    "List",
  ]
}


resource "azurerm_key_vault_access_policy" "kv_storage_access" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.kv_access_storage_objid

  secret_permissions = [
    "Get",
    "List",
  ]
}

