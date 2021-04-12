resource "random_string" "ns" {
  special = false
  upper = false
  length = 12
}

resource "azurerm_resource_group" "kv-rg" {
  name     = var.kv-rg
  location = "eastus"
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "kv1" {
  name                        = var.kv1
  location                    = azurerm_resource_group.kv-rg.location
  resource_group_name         = azurerm_resource_group.kv-rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  
  sku_name = "premium"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "list",
      "get",
    ]

    secret_permissions = [
      "list",
      "set",
      "get",
      "delete",
    ]
  }

  tags = {
    environment = "Development"
  }
}

resource "azurerm_key_vault_secret" "kv-ks" {
  name                        = "Secret1"
  value                       = "abcdef"
  key_vault_id                = azurerm_key_vault.kv1.id 
  
  tags = {
    environment = "Development"
  }
}  