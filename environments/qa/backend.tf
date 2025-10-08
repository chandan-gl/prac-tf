terraform {
  backend "azurerm" {
    # Uses the same storage account but a different state file key for isolation
    resource_group_name  = "adf_project"
    storage_account_name = "practeststorage"
    container_name       = "tfstate0310"
    key                  = "qa/keyvault.terraform.tfstate" # Isolated state file
  }
}