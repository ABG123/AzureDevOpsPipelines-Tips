output "azurerm_resource_group_name" {
    value = "${azurerm_resource_group.kv-rg.name}" 
}

output "azurerm_key_vault_name" {
    value = "${azurerm_key_vault.kv1.name}" 
}