resource "databricks_unity_catalog" "main" {
  name           = var.config["unitycatelog_name"]
  workspace_id   = azurerm_databricks_workspace.main.workspace_id
  resource_group = var.config["resource_group_name"]
}