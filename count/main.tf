terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {

  features {}  
}

locals {
  resource_group_name="app-grp"
  location="North Europe"
}
  resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location  
}

resource "azurerm_storage_account" "sa" {
  count = 10
  name                     = "${count.index}arjunstoragraccountts"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}
