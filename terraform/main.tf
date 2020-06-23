terraform {
  backend "local" {
    path = "terraform/terraform.tfstate"
  }
}

provider "azurerm" {
  version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "oa-infra-dev"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                     = "oainfraacrdev"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Basic"
  admin_enabled            = false
}

