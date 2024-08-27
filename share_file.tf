
# Create a resource group
resource "azurerm_resource_group" "share-file" {
  name     = "share-file"
  location = "East US"
}

resource "azurerm_storage_account" "sharefiles0001" {
  name                     = "sharefiles0001"
  resource_group_name      = azurerm_resource_group.share-file.name
  location                 = azurerm_resource_group.share-file.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "share-file" {
  name                 = "share-file"
  storage_account_name = azurerm_storage_account.sharefiles0001.name
  quota                = 50

  acl {
    id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

    access_policy {
      permissions = "rwdl"
      start       = "2019-07-02T09:38:21.0000000Z"
      expiry      = "2019-07-02T10:38:21.0000000Z"
    }
  }
}