# This defines the required providers for the root module
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  
  
}

variable "subscription_id" {
  type = string
  description = "The target Azure Subscription ID."
}
# Get the environment variables from dev.tfvars
variable "resource_group_name" { type = string }
variable "key_vault_suffix"    { type = string }


# Use the Key Vault Module
module "app_key_vault" {
  source = "../../modules/key_vault"
  subscription_id = var.subscription_id 

  # 2. Existing Resource Group name passed to the module
  resource_group_name = var.resource_group_name

  # Key Vault name includes an environment-specific suffix
  key_vault_name = "mydrive-${var.key_vault_suffix}"
  
  key_vault_sku = "standard"
  
  tags = {
    Environment = "Dev"
    Project     = "MyApp"
  }
}

output "dev_key_vault_uri" {
  value = module.app_key_vault.key_vault_uri
}