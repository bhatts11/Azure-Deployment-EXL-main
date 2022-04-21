
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

variable "location" {
  type        = string
  default     = ""
  description = "Location for the resources"
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group to be used for the resources."
}

variable "appservice_tier" {
  type        = string
  default     = ""
  description = "Azure App service Tier (Standard,Free,Basic, etc .)"
  validation {
    condition     = contains(["Free", "Basic", "Standard", "Premium", "PremiumV2", "PremiumV3"], var.appservice_tier)
    error_message = "Unsupported App service plan Tier. Please refer https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans for available Tiers."
  }
}

variable "appservice_size" {
  type        = string
  default     = ""
  description = "Azure App service Tier size"
  validation {
    condition     = contains(["F1", "B1", "B2", "B3", "S1", "S2", "S3", "P1v2", "P2v2", "P2v2", "P1v3", "P2v3", "P3v3"], var.appservice_size)
    error_message = "Unsupported App Service Size. Please refer https://azure.microsoft.com/en-us/pricing/details/app-service/windows/ for list of available sizes."
  }
}

variable "tags" {
  type        = map(any)
  description = "List of Tags."
}