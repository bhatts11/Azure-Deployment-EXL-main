variable "keyvalut_Name" {
  type        = string
  default     = ""
  description = "Name of the kev-vault to create"
  # validation {
  #   condition     = length(var.keyvalut_Name) < 24 && can(regex("dev", lower(var.keyvalut_Name)))
  #   error_message = " The keyvault_Name must be valid alphanumeric value less than 24 characters and dashes, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  # }
}
variable "keyvalut_SKU" {
  type        = string
  default     = "standard"
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
}
variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for key-valut deployment"
}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}

variable "tags" {
  type        = map(any)
  description = "List of Tags."
}

variable "kv_access_di_objid" {
  type        = string
  default     = "eastus2"
  description = "Object ID for the DI Webapp. This will allow DI Webapp to access Key Vault secrets."
}

variable "kv_access_dit_objid" {
  type        = string
  default     = ""
  description = "Object ID for the DIT Webapp. This will allow DIT Webapp to access Key Vault secrets."
}

variable "kv_access_storage_objid" {
  type        = string
  description = "Object ID for the Storage account. This will allow Storage account to access Key Vault secrets.."
}
