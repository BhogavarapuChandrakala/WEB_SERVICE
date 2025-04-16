resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = "webapp-vmss"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  network_interface {
    name    = "nic"
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = azurerm_subnet.subnet.id
    }
  }

  zone_balance = true
  upgrade_mode = "Automatic"
}
