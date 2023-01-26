data "azurerm_resource_group" "rg" {
  name = var.resource_group_name

}

resource "random_id" "storage_account" {
  byte_length = 8
}

resource "azurerm_storage_account" "sa" {
  name                     = "tfsta${lower(random_id.storage_account.hex)}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "tfstate-${random_id.storage_account.hex}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.container_access_type
}