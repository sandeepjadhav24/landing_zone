resource "azurerm_virtual_machine" "vmchild" {
  for_each = var.vmc

  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  vm_size               = each.value.vm_size
  network_interface_ids = [data.azurerm_network_interface.data_nic[each.key].id]

  storage_os_disk {
    name              = each.value.storage_os_disk.name
    create_option     = "fromimage"
    caching           = "ReadWrite"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

}

# resource "azurerm_linux_virtual_machine" "vm007" {
#       for_each = var.vmc

#       name = each.value.vm_name
#     resource_group_name = each.value.resource_group_name
#     location = each.value.location
#    size                            = "Standard_B2s"
#    disable_password_authentication = "false"
#    admin_username                  = "azureuser"
#    admin_password                  = "Admin@123456789"
#   network_interface_ids           = [azurerm_network_interface.vm_nic[count.index].id]


#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }
