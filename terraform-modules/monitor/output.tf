output "log_analy_work_id" {
  description = "The ID of the Log analytics workspace."
  value       = azurerm_log_analytics_workspace.log_workspace.id
}

output "log_workspace_pkey" {
  description = "Primary shared key for this Log analytics workspace."
  value       = azurerm_log_analytics_workspace.log_workspace.primary_shared_key
}
