resource "azurerm_mssql_server" "sql_server" {
  name                         = "webapp-sqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "S3cureP@ssw0rd!"
}

resource "azurerm_mssql_database" "sql_db" {
  name           = "webapp-db"
  server_id      = azurerm_mssql_server.sql_server.id
  sku_name       = "S1"
  zone_redundant = true
}
