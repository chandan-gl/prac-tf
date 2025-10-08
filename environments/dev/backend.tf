terraform {
  backend "azurerm" {
    # Replace with your pre-created backend storage details
    resource_group_name  = "adf_project"
    storage_account_name = "practeststorage"
    container_name       = "tfstate0310"
    key                  = "dev/keyvault.terraform.tfstate"
  }
}