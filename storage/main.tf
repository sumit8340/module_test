resource "azurerm_storage_account" "mysg" {
  name                     = var.azurerm_storage_account
  resource_group_name      = "myrg1"
  location                 = "east us"
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

}