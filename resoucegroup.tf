# Define variables
variable "adminstrator_login_password" {
  description = "The password for the administrator login."
  default     = "default_password"
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "Central canada"
}
