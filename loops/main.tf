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
  name                     = "arjun3232dafdfse"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}

resource "azurerm_storage_container" "data" {
    for_each = toset(["data", "files", "documents"])
    name = "data"
    storage_account_name = "arjun3232dafdfse"
    container_access_type = "blob"
    depends_on = [
      azurerm_storage_account.sa
    ]
}
