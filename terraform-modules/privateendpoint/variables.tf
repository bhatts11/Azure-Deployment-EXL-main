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

variable "location" {
  type        = string
  default     = ""
  description = "Location for the resources to be deployed"
}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Name of the resource group"
}

variable "private_endpoint_subnet_id" {
  type        = string
  default     = ""
  description = "Subnet Id to be associated with Private Endpoint. This will be fetched from VNET Module"
}

variable "privateconnectiondiapp" {
  type        = string
  default     = ""
  description = "Name of the Private Service Connection name for DI App."
}

variable "private_connectiondiapp_id" {
  type        = string
  default     = ""
  description = "App Service Resource ID for creating Private Service connection of DI App. This will be fetched from DI WebApp Module"
}

variable "privateconnectionditapp" {
  type        = string
  default     = ""
  description = "Name of the Private Service Connection name for DIT App."
}

variable "private_connectionditapp_id" {
  type        = string
  default     = ""
  description = "App Service Resource ID for creating Private Service connection of DIT App. This will be fetched from DIT WebApp Module"
}

variable "appdnslink" {
  type        = string
  default     = ""
  description = "Virtual Network Link for the Azure DNS created as part of App Service Private EndPoint Setup."
}

variable "storagedns" {
  type        = string
  default     = ""
  description = "Virtual Network Link for the Azure DNS created as part of Storage Account Private EndPoint Setup."
}

variable "keyvaultdns" {
  type        = string
  default     = ""
  description = "Virtual Network Link for the Azure DNS created as part of Key Vault Private EndPoint Setup."
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

variable "kv_private_endpoint_name" {
  type        = string
  default     = ""
  description = "Name of the private endpoint to be created for Key Vault."
}

variable "keyvault_private_connection" {
  type        = string
  default     = ""
  description = "Name of Private service connection for key vault"
}

variable "private_connection_keyvault_id" {
  type        = string
  default     = ""
  description = "Key Vault id for the private connection. This will be fetched from Key vault Module."
}


variable "tags" {
  type        = map(any)
  description = "List of Tags."
}


variable "dit_pe_diag_name" {
  type        = string
  default     = ""
  description = "Diagnostic setting name for DIT webapp private endpoint. This is set using join operation in the main.tf file under terraform-resources."
}

variable "di_pe_diag_name" {
  type        = string
  default     = ""
  description = "Diagnostic setting name for DI webapp private endpoint. This is set using join operation in the main.tf file under terraform-resources."
}

variable "storage_pe_diag_name" {
  type        = string
  default     = ""
  description = "Diagnostic setting name for storage account private endpoint. This is set using join operation in the main.tf file under terraform-resources."
}

variable "keyvault_pe_diag_name" {
  type        = string
  default     = ""
  description = "Diagnostic setting name for key vault private endpoint. This is set using join operation in the main.tf file under terraform-resources."
}

variable "log_analytics_workspace_id" {
  type        = string
  default     = ""
  description = "Log analytics workspace id. This workspace will be used to store the diagnostic data for private endpoint."
}

variable "metric_retention_days" {
  type        = number
  default     = 30
  description = "Number of retention for the metric settings."
}