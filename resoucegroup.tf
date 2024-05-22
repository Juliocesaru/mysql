# Create a resource group
resource "azurerm_resource_group" "juliosqlserver" {
  name     = var.myresourcegroupname
  location = "Central canada"
}
