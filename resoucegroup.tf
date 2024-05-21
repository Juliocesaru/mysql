# Create a resource group
resource "azurerm_resource_group" "juliosqlserver" {
  name     = "example-resources"
  location = "Central canada"
}
