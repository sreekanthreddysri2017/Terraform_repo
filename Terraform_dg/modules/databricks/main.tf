resource "azurerm_databricks_workspace" "main" {
  name                = var.config["workspace_name"]
  location            = var.config["workspace_location"]
  resource_group_name = var.config["resource_group_name"]
  sku             = var.config["sku"]
}





