variable "key_vault_name" {
  description = "The globally unique name for the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the existing Resource Group to place the Key Vault into."
  type        = string
}

variable "key_vault_sku" {
  description = "The SKU of the Key Vault. Options are 'standard' or 'premium'."
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault resource."
  type        = map(string)
  default     = {}
}
variable "subscription_id" {
  description = "The Azure Subscription ID."
  type        = string
}