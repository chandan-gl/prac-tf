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

# Get the environment variables from prod.tfvars
variable "resource_group_name" { type = string }
variable "key_vault_suffix"    { type = string }
variable "subscription_id" { type = string }

# Use the Key Vault Module with production-specific configuration
module "app_key_vault" {
  source = "../../modules/key_vault"
  subscription_id = var.subscription_id
  resource_group_name = var.resource_group_name
  key_vault_name      = "drive-${var.key_vault_suffix}"
  
  # Use the 'premium' SKU for production
  key_vault_sku = "standard" 
  
  tags = {
    Environment = "qa"
    Project     = "MyApp"
  }
}

output "prod_key_vault_uri" {
  value = module.app_key_vault.key_vault_uri
}