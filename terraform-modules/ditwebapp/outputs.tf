output "ditapp_service_name" {
  value = azurerm_app_service.ditwebapp.name
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.ditwebapp.default_site_hostname}"
}

output "ditapp_service_id" {
  value = azurerm_app_service.ditwebapp.id
}


output "ditapp_service_identity" {
  value = azurerm_app_service.ditwebapp.identity[0].principal_id

}