subscription_id = "aa01771c-5ab3-4809-b7e6-30c8080fc4ee"
project         = "vantage"
env             = "dev"
rg_Name         = "COE_Training" ## We have to change as per env
location        = "eastus"

tags = {
  ApplicationName = "Lockton Benefits Data Platform"
  Approver        = "kramadoss@lockton.com"
  BusinessUnit    = "PC"
  CostCenter      = "17100-170210-DA_BP-1"
  DR              = "Not Required"
  Env             = "dev"
  Owner           = "mmoitoso@lockton.com"
  ServiceClass    = "Silver"
  Classification  = "Internal Use Only"
}

defender_resource_type = ["SqlServers", "VirtualMachines", "AppServices"]

########################        VNET - SUBNET        ########################
#vnet_Name          = "vnet-terraform-modulesdev-eus2"
vnet_Address          = "192.168.0.0/16"
subnet_NameList       = ["snet-webapp", "snet-agw", "AzureFirewallSubnet", "GatewaySubnet", "AppServiceSwiftSub"]
subnet_AddressList    = ["192.168.0.0/18", "192.168.64.0/18", "192.168.128.0/19", "192.168.160.0/19", "192.168.192.0/19"]
log_retention_days    = 30
metric_retention_days = 30

######################### For APP GWY   ########################

#appgtwy_PublicIPName       = "pip-agw-terraform-modulesdev-eus2"
#appgtwy_MSIName            = "mi-devapp"
#appgtwy_Name               = "agw-terraform-modulesdev-eus2"
#appgtwy_Zones                  = ["1", "2", "3"]
# appgtwy_BackendAddressPool = "agw-terraform-modulesdev-backend-address-pool"
# appgtwy_FrontEndPort       = "agw-terraform-modulesdev-frontend-port"
# appgtwy_FrondEndIPConfig   = "agw-terraform-modulesdev-frontend-ip-config"
# appgtwy_HttpSetting        = "agw-terraform-modulesdev-http-setting"
# appgtwy_ListenrHttp        = "agw-terraform-modulesdev-listner"
# appgtwy_RequetRoutingRule  = "agw-terraform-modulesdev-request-routing-rule"
# appgtwy_RedirectConfig     = "agw-terraform-modulesdev-redirect-config"
# appgtwy_IPConfig     = "agw-terraform-modulesdev-ip-configuration"
appgtwy_AllocationMethod = "Static"
appgtwy_PipSKU           = "Standard"
appgtwy_SKUName          = "Standard_v2"
appgtwy_SKUTier          = "Standard_v2"
appgtwy_CapacityMin      = 1
appgtwy_CapacityMax      = 2
appgtwy_IdentityType     = "UserAssigned"

########################       Key Vault                ########################
# keyvalut_Name = "kv098-dev-eus2-01"
# keyvalut_SKU  = "standard"

########################            StorageAccount            ########################
#storageaccount_Name            = "stacveufhg7345"
#storageaccount_ContainerName   = "devdata"
# file_share_name                = "fileshare"
storageaccount_Tier            = "Standard"
storageaccount_Kind            = "StorageV2"
storageaccount_ReplicationType = "LRS"


########################            App Service Plan and Web App   ########################
# app_svc_name      = "terraform-test-plan"
app_svc_plan_kind = "Windows"
appservice_tier   = "Premium"
appservice_size   = "P1v2"

######################## DI and DIT WebAPP Resources   ########################

# diweb_app_name  = "vantage-diapp0724"
# ditweb_app_name = "vantage-ditapp08643"


######################## Private Endpoint variables       ########################

# di_private_endpoint_name = "diwebapp-pe"
# dit_private_endpoint_name = "ditwebapp-pe"
# privateconnectiondiapp  = "vantage-diapp-privcon"
# privateconnectionditapp = "vantage-ditapp-privcon"
# st_acc_private_endpoint_name = "vantage-storage-pe"
# storage_private_connection = "var.storage-privcon"
# appdnslink              = "vantage-webapp-dnslink"

########################   Azure Firewall variables  ########################

# firewall_pip  = "vantage_firewall_pip"
# firewall_name = "vantage_azure_fw"

########################      Azure Monitor      ########################

# log_workspace_name = 

