output "diapp_service_name" {
  value = azurerm_app_service.diwebapp.name
}

output "diapp_service_default_hostname" {
  value = "https://${azurerm_app_service.diwebapp.default_site_hostname}"
}

output "diapp_service_id" {
  value = azurerm_app_service.diwebapp.id
}

output "diapp_service_identity" {
  value = azurerm_app_service.diwebapp.identity[0].principal_id

}