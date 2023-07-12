resource "azurerm_resource_group" "myrg1" {
  name     = "myrg1"
  location = "east us"
}
resource "azurerm_virtual_network" "myvnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  address_space       = [var.address_space]

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.prefix
    }
  }
  depends_on = [ azurerm_resource_group.myrg1]
}
