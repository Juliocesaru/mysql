resource "azurerm_mssql_server" "sqlservercreation" {
  for_each = {for mssqlserver in local.juliosqlserver_app_list : "${mssqlserver.name}" => mssqlsesrver}
 
  name                         = each.value.name
  resource_group_name          = azurerm_resource_group.juliosqlserver.name
  location                     = azurerm_resource_group.juliosqlserver.location
  version                      = "var.version-number"

  administrator_login          = "var.administrator_login"
  administrator_login_password = "var.administrator_login_password"

  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "juliomcit"
    object_id      = "3a6e367c-4c7e-4672-83e5-d27c4f749e2a"
  }

  tags = {
    environment = "production"
  }
}
