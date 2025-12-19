resource "azurerm_resource_group" "rgchild" {
    for_each = var.rgc

    name = each.value.rgname 
    location = each.value.location
}