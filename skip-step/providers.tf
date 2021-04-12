provider "azurerm" {
  subscription_id = var.arm_subscription_id
  client_id       = var.arm_principal
  client_secret   = var.arm_password
  tenant_id       = var.tenant_id
  version         = "2.3.0"
  features {
      key_vault {
        purge_soft_delete_on_destroy = true
      }
  }
}

provider "azuread" {
  subscription_id = var.arm_subscription_id
  client_id       = var.arm_principal
  client_secret   = var.arm_password
  tenant_id       = var.tenant_id
  version         = "=0.7.0"
}