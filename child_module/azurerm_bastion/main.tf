resource "azurerm_public_ip" "pip" {
    for_each = var.bastion
  name = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  allocation_method = "Static"
  sku = "Standard"
  
}

resource "azurerm_bastion_host" "bastionhost" {
    for_each = var.bastion
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location

  ip_configuration {
    name = "Configuration"
    subnet_id = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
  
}