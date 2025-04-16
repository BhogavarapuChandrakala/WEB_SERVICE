provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "webapp-infra-rg"
  location = var.location
}
