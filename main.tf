resource "azurerm_key_vault" "everdriven_dev" {
  name                          = "testdriven-dev"
  location                      = var.location
  resource_group_name           = azurerm_resource_group.everdriven_rg.name
  sku_name                      = "standard"
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  public_network_access_enabled = true
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "everdriven_rg" {
  name     = var.resource_group_name
  location = var.location
}

