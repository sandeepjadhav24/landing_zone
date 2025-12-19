resource "azurerm_virtual_network" "vnetchild" {
    for_each = var.vnetc

    name = each.value.vnet_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    address_space = each.value.address_space
}