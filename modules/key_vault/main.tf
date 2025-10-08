# Data source to fetch the current user/service principal's Object ID for access policy
data "azurerm_client_config" "current" {}

# Get the existing Resource Group details using a Data Source
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# 1. Create the Azure Key Vault resource
resource "azurerm_key_vault" "main" {
  name                          = var.key_vault_name
  location                      = data.azurerm_resource_group.existing.location
  resource_group_name           = data.azurerm_resource_group.existing.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.key_vault_sku
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  public_network_access_enabled = true

  # Add access policy for the current user/service principal
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    # Permissions for keys, secrets, and certificates
    key_permissions         = ["Get", "List"]
    secret_permissions      = ["Get", "List", "Set", "Delete"]
    certificate_permissions = ["Get", "List"]
  }

  tags = var.tags
}