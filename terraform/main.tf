variable "client_secret" {}

terraform {
  backend "local" {
    path = "terraform/terraform.tfstate"
  }
}

provider "azurerm" {
  version = "=2.0.0"

  subscription_id = "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"
  client_id       = "c9185292-73e4-4bf1-90a7-7c12d59a3d2a"
  client_secret   = var.client_secret
  tenant_id       = "db1271e1-985e-4b67-957d-910f6618d2b4"

  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "oa-infra-dev"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                = "oainfraacrdev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
}

