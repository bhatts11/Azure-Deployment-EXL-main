# backend storageaccount declaration to store the terraform state file. This should exist already.
terraform {
  backend "azurerm" {
    #   subscription_id       = "da74xxxx-9c9a-xxxx-8fae-xxxxxxxxxxxx"
    subscription_id      = "aa01771c-5ab3-4809-b7e6-30c8080fc4ee"
    resource_group_name  = "COE_Training"
    storage_account_name = "terraformvantagedit1" # Storage account used for backend
    container_name       = "terraformstate"
    key                  = "terraform.tfstate" # Terraform State file
  }
}
# Azurerm providers declaration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.89"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }

  }
}
#required_version = ">= 0.13"

provider "azurerm" {
  alias                      = "vantageazure"
  subscription_id            = var.subscription_id
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "random_id" "storage_account" {
  byte_length = 1
}

resource "random_id" "keyvault" {
  byte_length = 1
}

resource "random_id" "app_plan" {
  byte_length = 1
}

### Data source for KV - to retrive the secrets from KV, declaring the existing KV details.
# data "azurerm_key_vault" "kv_name" {
#   name                = var.devKV_Name
#   resource_group_name = var.rg_Name
# }
## To get object & tenant ID , declaring the data source. 
data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}
#############################################################################

############# 1. VNET & SUBNET Deployment Code #############

module "vnet01" {
  source                     = "../terraform-modules/network"
  vnet_Name                  = join("-", [var.project, var.env, "vnet"])
  vnet_diag_name             = join("-", [var.project, var.env, "vnet-diag"])
  log_analytics_workspace_id = module.azmonitor.log_analy_work_id

  rg_Name               = var.rg_Name
  location              = var.location
  vnet_Address          = var.vnet_Address
  subnet_NameList       = var.subnet_NameList
  subnet_AddressList    = var.subnet_AddressList
  log_retention_days    = var.log_retention_days
  metric_retention_days = var.metric_retention_days
  tags                  = var.tags
}

#############################################################################

# ######## 2. APP Gateway Deployment Code ###########

module "app_gateway" {
  depends_on                 = [module.vnet01.subnet_agw]
  source                     = "../terraform-modules/appgateway"
  location                   = var.location
  rg_Name                    = var.rg_Name
  appgtwy_PublicIPName       = join("-", [var.project, var.env, "agw", "pip"])
  appgtwy_MSIName            = join("-", [var.project, var.env, "agwmsi"])
  appgtwy_Name               = join("-", [var.project, var.env, "agw"])
  appgtwy_BackendAddressPool = join("-", [var.project, var.env, "agw", "backpool"])
  appgtwy_FrontEndPort       = join("-", [var.project, var.env, "agw", "front-port"])
  appgtwy_FrondEndIPConfig   = join("-", [var.project, var.env, "agw", "frontip-config"])
  appgtwy_HttpSetting        = join("-", [var.project, var.env, "agw", "httpsetting"])
  appgtwy_ListenrHttp        = join("-", [var.project, var.env, "agw", "listner-http"])
  appgtwy_RequetRoutingRule  = join("-", [var.project, var.env, "agw", "routingrule"])
  appgtwy_IPConfig           = join("-", [var.project, var.env, "agw", "ipconfig"])
  #appgtwy_RedirectConfig     = join("-",[var.project, var.env, "agw", "pip"])
  appgtwy_AllocationMethod = var.appgtwy_AllocationMethod
  appgtwy_PipSKU           = var.appgtwy_PipSKU
  appgtwy_SKUName          = var.appgtwy_SKUName
  appgtwy_SKUTier          = var.appgtwy_SKUTier
  appgtwy_CapacityMin      = var.appgtwy_CapacityMin
  appgtwy_CapacityMax      = var.appgtwy_CapacityMax
  appgtwy_IdentityType     = var.appgtwy_IdentityType
  appgtwy_subnet_id        = module.vnet01.subnet_agw_Id
  tags                     = var.tags
}

#######################################################

#######################################################

######## 4. KEY Vault Deployment Code ###########

module "key_vault" {
  source                  = "../terraform-modules/keyvault"
  keyvalut_Name           = join("-", [var.project, var.env, "kv", lower(random_id.keyvault.hex)])
  rg_Name                 = var.rg_Name
  location                = var.location
  keyvalut_SKU            = "standard"
  tags                    = var.tags
  kv_access_di_objid      = module.diwebapp.diapp_service_identity
  kv_access_dit_objid     = module.ditwebapp.ditapp_service_identity
  kv_access_storage_objid = module.storage_account.storage_account_service_identity
}

#######################################################

######## 5. StorageAccount Deployment Code ###########
#${var.prefix}storageacct"

module "storage_account" {
  source                         = "../terraform-modules/storageaccount"
  storageaccount_Name            = join("", [var.project, var.env, "str", lower(random_id.storage_account.hex)]) #concat("${var.project}","${var.env}","${lower(random_id.storage_account.hex)}")
  storageaccount_ContainerName   = join("-", [var.project, var.env, "container"])
  file_share_name                = join("-", [var.project, var.env, "fileshare"])
  storageaccount_Tier            = var.storageaccount_Tier
  storageaccount_Kind            = var.storageaccount_Kind
  storageaccount_ReplicationType = var.storageaccount_ReplicationType
  rg_Name                        = var.rg_Name
  location                       = var.location
  tags                           = var.tags

}

######## 7. Azure Web App Deployment ###########
## Since site_config is dynamic and based on the framework. Site config needs to be changed in the WebApp module manually

module "appservice" {
  source            = "../terraform-modules/appservice"
  app_svc_name      = join("-", [var.project, var.env, "app-plan"])
  location          = var.location
  rg_Name           = var.rg_Name
  app_svc_plan_kind = var.app_svc_plan_kind
  appservice_tier   = var.appservice_tier
  appservice_size   = var.appservice_size
  tags              = var.tags
}


module "diwebapp" {
  source                     = "../terraform-modules/diwebapp"
  depends_on                 = [module.vnet01.subnet_pe]
  diweb_app_name             = join("-", [var.project, var.env, "diapp"])
  rg_Name                    = var.rg_Name
  app_plan_id                = module.appservice.app_service_id
  location                   = var.location
  swift_connection_subnet_id = module.vnet01.subnet_swiftconnec_Id
  tags                       = var.tags
}

module "ditwebapp" {
  source                     = "../terraform-modules/ditwebapp"
  depends_on                 = [module.vnet01.subnet_pe]
  ditweb_app_name            = join("-", [var.project, var.env, "ditapp"])
  rg_Name                    = var.rg_Name
  location                   = var.location
  app_plan_id                = module.appservice.app_service_id
  swift_connection_subnet_id = module.vnet01.subnet_swiftconnec_Id
  tags                       = var.tags
}

##### Private EndPoint Setup

module "privateendpoint" {
  source     = "../terraform-modules/privateendpoint"
  depends_on = [module.vnet01.subnet_pe]
  # PrivateEndpoint names
  di_private_endpoint_name     = join("-", [var.project, var.env, "diapp-pe"])
  dit_private_endpoint_name    = join("-", [var.project, var.env, "ditapp-pe"])
  st_acc_private_endpoint_name = join("-", [var.project, var.env, "storage-pe"])
  kv_private_endpoint_name     = join("-", [var.project, var.env, "keyvault-pe"])
  # PrivateConnection names
  privateconnectiondiapp      = join("-", [var.project, var.env, "diapp-pc"])
  privateconnectionditapp     = join("-", [var.project, var.env, "ditapp-pc"])
  storage_private_connection  = join("-", [var.project, var.env, "storage-pc"])
  keyvault_private_connection = join("-", [var.project, var.env, "keyvault-pc"])
  # Diagnostic Setting names
  dit_pe_diag_name      = join("-", [var.project, var.env, "ditapp-diag"])
  di_pe_diag_name       = join("-", [var.project, var.env, "diapp-diag"])
  storage_pe_diag_name  = join("-", [var.project, var.env, "storage-diag"])
  keyvault_pe_diag_name = join("-", [var.project, var.env, "keyvault-diag"])
  # DNS link names
  appdnslink  = join("-", [var.project, var.env, "appsvc-diag"])
  storagedns  = join("-", [var.project, var.env, "storage-diag"])
  keyvaultdns = join("-", [var.project, var.env, "keyvault-diag"])
  # Other dependencies
  rg_Name                        = var.rg_Name
  location                       = var.location
  private_endpoint_subnet_id     = module.vnet01.subnet_pe_Id
  private_connectiondiapp_id     = module.diwebapp.diapp_service_id
  private_connectionditapp_id    = module.ditwebapp.ditapp_service_id
  private_connection_strg_id     = module.storage_account.storage_account_id
  private_connection_keyvault_id = module.key_vault.key_vault_id
  private_endpoint_vnet_id       = module.vnet01.vnet_Id
  log_analytics_workspace_id     = module.azmonitor.log_analy_work_id
  tags                           = var.tags

}

#### Azure Firewall Module Section

module "firewall" {
  source        = "../terraform-modules/firewall"
  depends_on    = [module.vnet01.subnet_azfw]
  firewall_name = join("-", [var.project, var.env, "firewall"])
  firewall_pip  = join("-", [var.project, var.env, "firewall-pip"])
  location      = var.location
  rg_Name       = var.rg_Name
  subnet_id     = module.vnet01.subnet_azfw_Id
  tags          = var.tags
  azfw_sku_tier = "Standard" #var.azfw_sku_tier
  azfw_sku_name = "AZFW_VNet"

}

#### Azure Monitor and Log analytics workspace module

module "azmonitor" {
  source                          = "../terraform-modules/monitor"
  depends_on                      = [module.storage_account]
  log_workspace_name              = join("-", [var.project, var.env, "law"])
  location                        = var.location
  rg_Name                         = var.rg_Name
  tags                            = var.tags
  log_analytics_dest_res_id       = module.storage_account.storage_account_id
  target_subs_id                  = "/subscriptions/${var.subscription_id}"
  monitor_action_group_name       = join("-", [var.project, var.env, "action"])
  monitor_action_group_short_name = join("-", [var.project, "act"])
  #subscriptionid                 = [data.azurerm_subscription.current.id]
  # azurerm_storage_account.asa_02.id
  # "/subscriptions/$(var.subscription_id)"

}