variable "firewall_pip" {
  type        = string
  default     = ""
  description = "Name of Public IP resource to be created for Azure Firewall."
}

variable "location" {
  type        = string
  default     = ""
  description = "Location for the resources to be created."
}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource Group name for these resources."
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

variable "tags" {
  type        = map(any)
  description = "List of Tags."
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


