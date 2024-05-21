# Create a resource group
resource "azurerm_resource_group" "juliosqlserver"{
  name     = "juliosqlserver"
  location = "Central canada"
}
