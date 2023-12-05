terraform {
  required_providers {
    azurerm= {
      source  = "hashicorp/azurerm"
      version="3.82.0"

    }
  }
  backend "azurerm" {
    resource_group_name  = "DGB-RG-PF-001"
    storage_account_name = "dgbstpf001"
    container_name       = "tfdev"
    key                  = "cuebox/terraform.tfstate"
  }
}


provider "azurerm" {
  features  {}
  client_id = var.CLIENT_AD_ID
  tenant_id = var.TENANT_AD_ID
  subscription_id = var.SUBSCRIPTION_AD_ID
  client_secret = var.CLIENT_AD_SECRET
}

locals {
  config_data = jsondecode(file("config.json"))
}

module "storage_account" {
  source = "./modules/storage_account"

  for_each = { for entry in local.config_data["storage_account"] : entry["account_name"] => entry }

  config = each.value
}

module "key_vault" {
  source = "./modules/key_vault"

  for_each = { for entry in local.config_data["key_vault"] : entry["vault_name"] => entry }

  config = each.value
}

module "databricks_workspace"{
  source = "./modules/databricks"
  for_each = { for entry in local.config_data["databricks_workspace"] : entry["workspace_name"] => entry }

  config = each.value
}

module "databricks_metastore" {
  source = "./modules/metastore"
  for_each = {for entry in local.config_data["databricks_metastore"] : entry["metastore_name"] => entry}

  config = each.value
}



