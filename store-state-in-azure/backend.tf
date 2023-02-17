terraform {
  backend "azurerm" {
    resource_group_name  = "my-terraform-rg"
    storage_account_name = "mytfstorageaccoaa"
    container_name       = "my-terraform-state-container"
    key                  = "terraform.tfstate"
  }
}