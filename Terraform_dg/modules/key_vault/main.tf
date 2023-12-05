#variable "config" {
#  description = "Configuration for key vault"
#  type        = map
#}

resource "azurerm_key_vault" "main" {
  name                        = var.config["vault_name"]
  location                    = var.config["vault_location"] # Update with your desired location
  resource_group_name         = var.config["resource_group_name"] # Update with your desired resource group
  sku_name                    = var.config["sku_name"]
  tenant_id                   = var.config["tenant_id"] # Update with your Azure AD tenant ID
  enabled_for_disk_encryption = var.config["enabled_for_disk_encryption"]
  soft_delete_retention_days  = var.config["soft_delete_retention_days"]

}

