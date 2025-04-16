resource "azurerm_api_management" "api" {
  name                = "webapp-apim"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "My Company"
  publisher_email     = "admin@company.com"
  sku_name            = "Developer_1"
}
