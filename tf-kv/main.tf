terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

# configure provider
provider "azurerm" {
  features {
  }
}
resource "azurerm_resource_group" "apprg" {
  name     = "arjunrg4"
  location = "westus2"
  tags = {
    "env" = "dev"
    "owner" = "arjun"
  }
}
data "azurerm_client_config" "current"{}

resource "azurerm_key_vault" "appvault" {
  name                        = "appvault78868arjun"
  location                    = azurerm_resource_group.apprg.location
  resource_group_name         = azurerm_resource_group.apprg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get","Set"
    ]    
  }

}

resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = "Azure@123"
  key_vault_id = azurerm_key_vault.appvault.id

}