resource "azurerm_mssql_server" "sqlservercreation" {
  for_each = {for mssqlserver in local.juliomcit : mssqlserver.name => mssqlserver}

  name                         = each.value.name
  resource_group_name          = azurerm_resourse_group.juliosqlserver.name
  location                     = azurerm_resourse_group.juliosqlserver.location
  

  version                      = "12.0"

  administrator_login          = "var.administrator_login"
  administrator_login_password = "var.administrator_login_password"

  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "3a6e367c-4c7e-4672-83e5-d27c4f749e2a"
  }

  tags = {
    environment = "production"
  }
}
