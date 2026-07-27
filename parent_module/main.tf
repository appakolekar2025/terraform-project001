module "rgs" {
    source = "../child_module/azurerm_resource_group"
    rgs = var.resource_group
  
}
module "vnet" {
    depends_on = [ module.rgs ]
    source = "../child_module/azurerm_virtual_network"
    vnet = var.virtual_network
  
}
module "subnet" {
    depends_on = [ module.vnet ]
    source = "../child_module/azurerm_subnet"
    snet = var.subnet
  
}
module "bastion" {
    depends_on = [ module.subnet ]
    source = "../child_module/azurerm_bastion"
    bastion = var.bastion

}
module "nsg" {
    depends_on = [ module.subnet ]
    source = "../child_module/azurerm_nsg"
    nsg = var.network_security_group
  
}
module "nic" {
    depends_on = [ module.subnet ]
    source = "../child_module/azurerm_nic"
    nic = var.network_interface_card
  
}
module "vm" {
    depends_on = [ module.nic ]
    source = "../child_module/azurerm_vm"
    vm = var.virtual_machine
  
}