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
    name = local.resource_group_name
    location = local.location
}