
variable "app_plan_id" {
  type        = string
  description = "WebApp Plan id to be used for the app service. This will be fetched from the app plan created as part of this deployment."
}

variable "diweb_app_name" {
  type        = string
  default     = ""
  description = "Webapp name to deploy the resources"
  validation {
    condition     = (can(regex("^[a-zA-Z0-9-]*$", var.diweb_app_name)))
    error_message = "App Service plan name can only have alpanumeric values and dash in the name."
  }
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for aks cluster deployment"
}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}

variable "swift_connection_subnet_id" {
  type        = string
  default     = ""
  description = "Subnet ID for the swif connection."
}

variable "tags" {
  type        = map(any)
  description = "List of Tags."
}