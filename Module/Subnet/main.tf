resource "azurerm_subnet" "subnetchild" {
    for_each = var.subnetc

    name = each.value.subnet_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
    address_prefixes = each.value.address_prefixes
  
}