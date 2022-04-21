# Ticket 25912 - Create Log Analytics Workspace

locals {
  activity_log_actions = [
    "Microsoft.Sql/servers/firewallRules/write",
    "Microsoft.Sql/servers/firewallRules/delete",
    "Microsoft.Network/networkSecurityGroups/write",
    "Microsoft.Network/networkSecurityGroups/delete",
    "Microsoft.ClassicNetwork/networkSecurityGroups/write",
    "Microsoft.ClassicNetwork/networkSecurityGroups/delete",
    "Microsoft.Network/networkSecurityGroups/securityRules/write",
    "Microsoft.Network/networkSecurityGroups/securityRules/delete",
    "Microsoft.ClassicNetwork/networkSecurityGroups/securityRules/write",
    "Microsoft.ClassicNetwork/networkSecurityGroups/securityRules/delete"
  ]
}
data "azurerm_subscription" "current" {}

resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.log_workspace_name
  location            = var.location
  resource_group_name = var.rg_Name
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_log_analytics_data_export_rule" "alaw_export_rule_01" {
  name                    = "alawexportrule01"
  resource_group_name     = var.rg_Name
  workspace_resource_id   = azurerm_log_analytics_workspace.log_workspace.id
  destination_resource_id = var.log_analytics_dest_res_id
  table_names             = ["Heartbeat"]
  enabled                 = true
}

resource "azurerm_monitor_diagnostic_setting" "log_profile_lbdp_dev" {
  name                       = "log-profile-lbdp-dev"
  target_resource_id         = var.target_subs_id # LBDP-dev
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id

  log {
    category = "Administrative"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}

resource "azurerm_monitor_action_group" "lbdp_monitor_action_group" {
  name                = var.monitor_action_group_name
  resource_group_name = var.rg_Name
  short_name          = var.monitor_action_group_short_name
  tags                = var.tags
}

resource "azurerm_monitor_activity_log_alert" "admin_activity_log_alerts" {
  for_each            = toset(local.activity_log_actions)
  name                = "admin-activity-log-alert-${index(local.activity_log_actions, each.value) + 1}"
  resource_group_name = var.rg_Name
  scopes              = [data.azurerm_subscription.current.id]
  description         = "Alert for admin action: ${each.value}"

  criteria {
    resource_id    = azurerm_log_analytics_workspace.log_workspace.id
    operation_name = each.value
    category       = "Administrative"
  }

  action {
    action_group_id = azurerm_monitor_action_group.lbdp_monitor_action_group.id

    webhook_properties = {
      from = "terraform"
    }
  }

  tags = var.tags
}
