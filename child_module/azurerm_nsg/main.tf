resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg
  name = each.value.name
  resource_group_name = each.value.resource_group_name
location = each.value.location
  
}

resource "azurerm_subnet_network_security_group_association" "associa" {
    for_each = var.nsg
  subnet_id = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
  
}