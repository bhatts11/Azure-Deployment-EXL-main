################# Universal Variables ###################

variable "subscription_id" {
  type        = string
  default     = ""
  description = "Subscription id for this deployment"
}

variable "project" {
  type        = string
  default     = "centralus"
  description = "The project name."
}

variable "env" {
  type        = string
  default     = "centralus"
  description = "Name of the environment where these resources will be deployed."
}
variable "tags" {
  type        = map(any)
  description = "List of Tags."
}

variable "defender_resource_type" {
  type = list(string)
}


variable "location" {
  type        = string
  default     = ""
  description = "Location to deploy Azure Resources."
}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Name of the resource group where these resources need to be created."
}

variable "log_analytics_workspace_id" {
  type        = string
  default     = ""
  description = "Log Analytics Workspace ID to store diagnostic settings."
}

################# VNET module Variables ###################

variable "vnet_Name" {
  type        = string
  default     = ""
  description = "Name of the virtual network where these resources will be created."
}
variable "vnet_Address" {
  type        = string
  default     = ""
  description = "CIDR range for this virtual network."
}
variable "subnet_NameList" {
  type        = list(string)
  default     = [""]
  description = "Names of the Subnet list of this virtual network."
}
variable "subnet_AddressList" {
  type        = list(string)
  default     = [""]
  description = "CIDR range of the Subnet list of this virtual network."
}

variable "vnet_diag_name" {
  type        = string
  default     = ""
  description = "Azure Monitor Diagnostic Setting name for this Virtual Network."
}

variable "log_retention_days" {
  type        = number
  default     = 30
  description = "Number of retention for the diagnostic logs."
}

variable "metric_retention_days" {
  type        = number
  default     = 30
  description = "Number of retention for the metric settings."
}


##### Application Gateway Variables.
variable "appgtwy_PublicIPName" {
  type        = string
  default     = ""
  description = "Public IP name to use for APP Gateway"
}
variable "appgtwy_AllocationMethod" {
  type        = string
  default     = "Static"
  description = "Allocation method for APP Gateway"
}
variable "appgtwy_PipSKU" {
  type        = string
  default     = "Standard"
  description = "SKU of the Public IP to be used for APP Gateway"
}
variable "appgtwy_MSIName" {
  type        = string
  default     = ""
  description = "MSI Name to use for APP Gateway"
}
variable "appgtwy_BackendAddressPool" {
  type        = string
  default     = ""
  description = "APP Gateway bacend address pool name"
}
variable "appgtwy_FrontEndPort" {
  type        = string
  default     = ""
  description = "APP Gateway front end port name "
}
variable "appgtwy_FrondEndIPConfig" {
  type        = string
  default     = ""
  description = "APP Gateway Front end IP configuration name "
}
variable "appgtwy_HttpSetting" {
  type    = string
  default = ""
}
variable "appgtwy_ListenrHttp" {
  type        = string
  default     = ""
  description = "APP Gatewat HTTP Listner name"
}
variable "appgtwy_RequetRoutingRule" {
  type        = string
  default     = ""
  description = "APP Gateway Routing rule name"
}
variable "appgtwy_RedirectConfig" {
  type        = string
  default     = ""
  description = "APP Gateway redirection configuration name"
}
variable "appgtwy_Name" {
  type        = string
  default     = ""
  description = "Applicate Gateway Name"
}

variable "appgtwy_SKUName" {
  type        = string
  default     = ""
  description = "Type of SKU  to use for APP Gateway "
}
variable "appgtwy_SKUTier" {
  type        = string
  default     = ""
  description = "Type SKU Tier to use for APP Gateway"
}
variable "appgtwy_CapacityMin" {
  type        = number
  default     = 1
  description = "Minimum capacity for autoscaling. Accepted values are in the range 0 to 100"
}
variable "appgtwy_CapacityMax" {
  type        = number
  default     = 2
  description = "Maximum capacity for autoscaling. Accepted values are in the range 2 to 125."
}
variable "appgtwy_IdentityType" {
  type        = string
  default     = "userAssigned"
  description = "Identy to use for APP Gateway"

}
variable "appgtwy_IPConfig" {
  type        = string
  default     = ""
  description = "Gateway IP Configurations to use"
}

variable "appgtwy_subnet_id" {
  type        = string
  default     = ""
  description = "APP Gateway to use subnet for front end, this will be allocated from module"
}


##
###
variable "keyvalut_Name" {
  type    = string
  default = ""
}
variable "keyvalut_SKU" {
  type    = string
  default = ""
}
### StorageAccount
variable "storageaccount_Name" {
  type    = string
  default = ""
}
variable "storageaccount_Tier" {
  type    = string
  default = ""
}
variable "storageaccount_Kind" {
  type    = string
  default = ""
}
variable "storageaccount_ReplicationType" {
  type    = string
  default = ""
}
variable "storageaccount_ContainerName" {
  type    = string
  default = ""
}

variable "file_share_name" {
  type        = string
  default     = ""
  description = "File Share name to create with in the storage account"
}

#### App Service variables ####

variable "app_svc_name" {
  type        = string
  default     = ""
  description = "App Service Plan name"
}

variable "app_svc_plan_kind" {
  type        = string
  default     = "Windows"
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}

variable "appservice_tier" {
  type        = string
  default     = ""
  description = "Azure App service Tier (Standard,Free,Basic, etc .)"
}

variable "appservice_size" {
  type        = string
  default     = ""
  description = "Azure App service Tier size"
}

### DI WebApp ###

variable "diweb_app_name" {
  type        = string
  default     = ""
  description = "Webapp name to deploy the resources"
}

### DIT WebApp ###

variable "ditweb_app_name" {
  type        = string
  default     = ""
  description = "Webapp name to deploy the resources"
}

#### Private Endpoint module variables list.

variable "di_private_endpoint_name" {
  type        = string
  default     = ""
  description = "Name of the private endpoint to be created for DI WebApp."
}

variable "dit_private_endpoint_name" {
  type        = string
  default     = ""
  description = "Name of the private endpoint to be created for DIT WebApp."
}

variable "private_endpoint_subnet_id" {
  type        = string
  default     = ""
  description = "Subnet Id to be associated with Private Endpoint. This will be fetched from VNET Module"
}

variable "privateconnectiondiapp" {
  type        = string
  default     = ""
  description = "Private Service Connection name for DI App. This will be fetched from DI WebApp Module"
}

variable "private_connectiondiapp_id" {
  type        = string
  default     = ""
  description = "App Service Resource ID for creating Private Service connection of DI App. This will be fetched from DI WebApp Module"
}

variable "privateconnectionditapp" {
  type        = string
  default     = ""
  description = "Private Service Connection name for DIT App. This will be fetched from DIT WebApp Module"
}

variable "private_connectionditapp_id" {
  type        = string
  default     = ""
  description = "App Service Resource ID for creating Private Service connection of DIT App. This will be fetched from DIT WebApp Module"
}

variable "appdnslink" {
  type        = string
  default     = ""
  description = "Virtual Network Link for the Azure DNS created as part of Private EndPoint Setup."
}

variable "storagedns" {
  type        = string
  default     = ""
  description = "Virtual Network Link for the Azure DNS created as part of Storage Account Private EndPoint Setup."
}


variable "private_endpoint_vnet_id" {
  type        = string
  default     = ""
  description = "Virtual Network ID to be associated with Azure Private DNS created as part of Private Endpoint. This will be fetched from VNET Module."
}


variable "st_acc_private_endpoint_name" {
  type        = string
  default     = ""
  description = "Name of the private endpoint to be created for Storage Account."
}

variable "storage_private_connection" {
  type        = string
  default     = ""
  description = "Private Service Connection name for Storage Account. This will be fetched from Storage Account Module."
}

variable "private_connection_strg_id" {
  type        = string
  default     = ""
  description = "Virtual Network ID to be associated with Azure Private DNS created as part of Private Endpoint. This will be fetched from VNET Module."
}

### Azure Firewall Variables section

variable "firewall_pip" {
  type        = string
  default     = ""
  description = "Name of Public IP resource to be created for Azure Firewall."
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "Subnet Id to be used for Azure Firewall."
}

variable "firewall_name" {
  type        = string
  default     = ""
  description = "Name of Azure Firewall to be created."
}

variable "azfw_sku_name" {
  type        = string
  default     = "AZFW_VNet"
  description = "Azure Firewall SKU Name"
  validation {
    condition     = contains(["AZFW_Hub", "AZFW_VNet"], var.azfw_sku_name)
    error_message = "Possible values are AZFW_Hub and AZFW_VNet."
  }
}


variable "azfw_sku_tier" {
  type        = string
  default     = "Standard"
  description = "SKU Tier for Azure Firewall"
  validation {
    condition     = contains(["Basic", "Premium", "Standard"], var.azfw_sku_tier)
    error_message = "Possible values are Basic, Premium and Standard."
  }
}


### Azure Monitor Modules Variables section.

variable "log_workspace_name" {
  type        = string
  default     = "centralus"
  description = "Name of Log Analytics Workspace."
}

variable "log_analytics_dest_res_id" {
  type        = string
  default     = "centralus"
  description = "This is the resource id where log analytics need to be store the data. Fetched from storage account module."
}


variable "target_subs_id" {
  type        = string
  default     = "centralus"
  description = "Resource ID for which log azure monitor diagnostic need to be created. This is hardcoded since we are enabling it for entire subscription"
}

variable "monitor_action_group_name" {
  type        = string
  default     = "centralus"
  description = "Name of the azure monitor action group. This is hardcoded and will be based on the project and environment name."
}

variable "monitor_action_group_short_name" {
  type        = string
  default     = "centralus"
  description = "Short Name of the azure monitor action group. This is hardcoded and will be based on the project and environment name."
}
