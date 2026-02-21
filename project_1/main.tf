resource "azurerm_resource_group" "rg_name" {
  name     = "storage-rg-01"
  location = "Southeast Asia"
}

resource "azurerm_storage_account" "pw_sg" {
  name                     = "storagewithterraform01"
  resource_group_name      = azurerm_resource_group.rg_name.name
  location                 = azurerm_resource_group.rg_name.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "storage-rg-01"
  }
}
resource "azurerm_storage_container" "stg_container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.pw_sg.id
  container_access_type = "blob"
}