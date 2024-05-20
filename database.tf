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
