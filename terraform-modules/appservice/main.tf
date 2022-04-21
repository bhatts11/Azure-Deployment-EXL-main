resource "azurerm_app_service_plan" "webapp_plan" {
  name                = var.app_svc_name
  location            = var.location
  resource_group_name = var.rg_Name
  kind                = var.app_svc_plan_kind
  tags                = var.tags

  sku {
    tier = var.appservice_tier
    size = var.appservice_size
  }

}
