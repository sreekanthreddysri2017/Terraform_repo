#variable "config" {
#  description = "Configuration for storage account"
#  type        = map
#}

resource "azurerm_storage_account" "main" {
  name                     = var.config["account_name"]
  account_tier             = var.config["account_tier"]
  location                 = var.config["location"]
  resource_group_name      = var.config["resource_group_name"]
  account_replication_type = var.config["account_replication_type"]
}
