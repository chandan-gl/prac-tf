variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
  default     = "East US"
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = "everdriven-dev"
}

variable "access_policies" {
  description = "List of access policies for the Key Vault."
  type = list(object({
    tenant_id = string
    object_id = string
    permissions = object({
      keys         = list(string)
      secrets      = list(string)
      certificates = list(string)
    })
  }))
  default = []
}

variable "access_policy_object_id" {
  description = "The object ID for the Key Vault access policy."
  type        = string
  default     = "105438dd-03c4-4fa9-b6d3-1f986f4ccc58"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "testdriven-dev-rg"
}

variable "backend_resource_group_name" {
  description = "Resource group name for Terraform backend"
  type        = string
  default     = "adf_project"
}

variable "backend_storage_account_name" {
  description = "Storage account name for Terraform backend"
  type        = string
  default     = "practeststorage"
}

variable "backend_container_name" {
  description = "Container name for Terraform backend"
  type        = string
  default     = "tfstate0310"
}

variable "backend_key" {
  description = "State file key for Terraform backend"
  type        = string
  default     = "terraform.tfstate"

}