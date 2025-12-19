resource "azurerm_network_interface" "nicchild" {
  for_each = var.nicc

  name = each.value. nic_name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  ip_configuration {
    name = each.value.ip_configuration.name
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    subnet_id = data.azurerm_subnet.data_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
  }
}