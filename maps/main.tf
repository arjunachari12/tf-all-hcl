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
  virtual_network = {
    name = "vnet"
    address_space = "10.0.0.0/16"
  }
}

resource "azurerm_resource_group" "appgrp" {
    name = local.virtual_network.name
    location = local.location
}