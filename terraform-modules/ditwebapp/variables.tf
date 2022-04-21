variable "ditweb_app_name" {
  type        = string
  default     = ""
  description = "Webapp name to deploy the resources"
  validation {
    condition     = (can(regex("^[a-zA-Z0-9-]*$", var.ditweb_app_name)))
    error_message = "App Service plan name can only have alpanumeric values and dash in the name."
  }
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for the deployment"
}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}


variable "app_plan_id" {
  type        = string
  default     = ""
  description = "App Service Plan ID for the resources. This will be fetched from App Service Plan"
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