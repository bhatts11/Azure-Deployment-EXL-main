output "app_service_id" {
  value = azurerm_app_service_plan.webapp_plan.id
}

output "app_service_name" {
  value = azurerm_app_service_plan.webapp_plan.name
}