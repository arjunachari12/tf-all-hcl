terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 0.1.2"
}

provider "azurerm" {
  features {
  }
}

data "azurerm_resource_group" "rg" {
    name = "arjunrg-manualprovision"  
}

output "id" {
    value = data.azurerm_resource_group.rg.id
}