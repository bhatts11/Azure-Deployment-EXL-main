variable "storageaccount_Name" {
  type        = string
  default     = ""
  description = "Name of the storage account"
  # validation {
  #   condition     = length(var.storageaccount_Name) > 6 && can(regex("dev", lower(var.storageaccount_Name)))
  #   error_message = " The storageaccount_Name must be valid name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  # }
}
variable "storageaccount_Tier" {
  type        = string
  default     = "Standard"
  description = "Defines the Tier to use for storage account - valid options are Standard or Premium"
}
variable "storageaccount_Kind" {
  type        = string
  default     = "StorageV2"
  description = "Defines kind of account - Valid options are Storage, StorageV2"
}
variable "storageaccount_ReplicationType" {
  type        = string
  default     = "LRS"
  description = "Defines the type of replication to use - Valid options are LRS,GRS,RAGRS,ZRS"
}
variable "storageaccount_ContainerName" {
  type        = string
  default     = ""
  description = "blob continer name to create with in the storage account"
}
variable "location" {
  type        = string
  default     = "eastus2"
  description = "Storage account location name"
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}

variable "file_share_name" {
  type        = string
  default     = ""
  description = "File Share name to create with in the storage account"
}

variable "tags" {
  type        = map(any)
  description = "List of Tags."
}