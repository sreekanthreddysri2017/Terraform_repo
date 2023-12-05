resource "databricks_metastore" "main" {
  name          = var.config["metastore_name"]
  storage_root  = var.config["storage_root"]
  owner         = var.config["owner"]
  region        = var.config["region"]
  force_destroy = var.config["forced_destroy"]
}