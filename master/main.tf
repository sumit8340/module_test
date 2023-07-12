module "virtual_network" {
   source = "../vnet"
  virtual_network_name = "myvnet"
  address_space        = "10.0.0.0/16"
  subnets = [
    {
      name   = "default"
      prefix = "10.0.1.0/24"
    }
  ]
}
module "azurerm_storage_account" {
  source = "../storage" 
  account_tier             = "Standard"
  account_replication_type = "GRS"
  azurerm_storage_account="mysg"
depends_on = [ module.virtual_network ]
}
module "virtual_machine" {
  source = "../vm"
  vm_size             = "Standard_D2_v2"
  virtual_network_name = "myvnet"
  subnet_name          = "default"
  admin_username       = "adminuser"
  admin_password       = "P@ssw0rd1234!"
  os_image = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  depends_on = [ module.virtual_network ]
}