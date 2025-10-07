output "key_vault_id" {
  value = azurerm_key_vault.everdriven_dev.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.everdriven_dev.vault_uri
}