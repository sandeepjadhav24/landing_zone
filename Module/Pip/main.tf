resource "azurerm_public_ip" "pipchild" {
    for_each = var.pipc

    name = each.value.pip_name
    resource_group_name =  each.value.resource_group_name
    location = each.value.location
    allocation_method = each.value.allocation_method 
}