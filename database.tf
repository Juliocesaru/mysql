provider "azurerm" {
  features {}
}

resource "azurerm_mysql_server" "mysqlapps" {
  name                = "example-mysqlserver"
  location            = azurerm_resource_group.juliosqlserver.location
  resource_group_name = azurerm_resource_group.juliosqlserver.name
   
  administrator_login          = "var.administrator_login"
  administrator_login_password = "var.administrator_login_password"
  
  sku_name   = "B_Gen5_2" 
  storage_mb = 5120
  version    = "var.version-number"
  
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  auto_grow_enabled                 = true
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_resource_group" "mysqlapps" {
  name     = "database-rg"
  location = "West Europe"
}

resource "azurerm_mssql_server" "sqlservercreation" {
  for_each = {for mssqlserver in local.juliosqlserver_app_list : "${mssqlserver.name}" => mssqlsesrver}
 
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}
