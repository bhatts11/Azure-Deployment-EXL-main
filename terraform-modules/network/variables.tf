variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for vent & subnet deployments"
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}
variable "vnet_Name" {
  type        = string
  default     = ""
  description = "Name of the vnet to create "
  # validation {
  #   condition     = length(var.vnet_Name) > 6 && can(regex("dev", lower(var.vnet_Name)))
  #   error_message = " The vnet_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  # }
}
variable "vnet_Address" {
  type        = string
  default     = ""
  description = "The address space that is used by the virtual network"
}
variable "subnet_NameList" {
  type        = list(string)
  default     = [""]
  description = "List of subnet names inside the Vnet"
  # validation {
  #   condition = alltrue([
  #     for snet in var.subnet_NameList : length(snet) > 6 && can(regex("dev", lower(snet))) || can(regex("gate", lower(snet)))
  #   ])
  #   error_message = " The subnet_NameList must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  # }
}
variable "subnet_AddressList" {
  type        = list(string)
  default     = [""]
  description = "The address prefix to use for the subnet."
}

variable "vnet_diag_name" {
  type        = string
  default     = ""
  description = "Azure Monitor Diagnostic Setting name for this Virtual Network."
}

variable "log_analytics_workspace_id" {
  type        = string
  default     = ""
  description = "Log Analytics Workspace ID to store diagnostic settings."
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

variable "tags" {
  type        = map(any)
  description = "List of Tags."
}