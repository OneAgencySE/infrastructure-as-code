variable "subscription_id" {
  type    = string
  default = "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"
}
variable "tenant_id" {
  type    = string
  default = "db1271e1-985e-4b67-957d-910f6618d2b4"
}
variable "client_id" {
  type    = string
  default = "c9185292-73e4-4bf1-90a7-7c12d59a3d2a"
}
variable "client_secret" {
  type = string
}

terraform {
  #backend "local" {
  #  path = "terraform/terraform.tfstate"
  #}
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "oa-infrastructure-as-code"

    workspaces {
      name = "infrastructure-as-code"
    }
  }
}

provider "azurerm" {
  version = "=2.25.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

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