
resource "azurerm_windows_virtual_machine" "vm" {
    for_each = var.vm
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  size = each.value.size
 admin_username = each.value.admin_username
 admin_password = each.value.admin_password
 network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]

os_disk {
  caching = each.value.os_disk_caching
  storage_account_type = each.value.os_disk_storage_account_type
}

 source_image_reference{
    offer=each.value.source_image_reference_offer
    publisher=each.value.source_image_reference_publisher
    sku=each.value.source_image_reference_sku
    version=each.value.source_image_reference_version
 }

}
