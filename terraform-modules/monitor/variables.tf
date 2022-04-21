variable "log_workspace_name" {
  type        = string
  default     = "centralus"
  description = "Name of Log Analytics Workspace."
}

variable "location" {
  type        = string
  default     = "centralus"
  description = "Location to create these resources."
}

variable "rg_Name" {
  type        = string
  default     = "centralus"
  description = "Name of the Resource Group."
}

variable "tags" {
  type        = map(any)
  description = "List of Tags."
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


variable "subscriptionid" {
  type        = string
  default     = ""
  description = "Subscription id"
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
