resource_group = {
  rg1 = {
    name     = "prod_rg"
    location = "centralindia"
  }
}

virtual_network = {
  vnet1 = {
    name                = "prod_vnet"
    resource_group_name = "prod_rg"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  snets1 = {
    name                 = "frontend_subnet"
    resource_group_name  = "prod_rg"
    location             = "centralindia"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.0.0/24"]
  }
  snets2 = {
    name                 = "backend_subnet"
    resource_group_name  = "prod_rg"
    location             = "centralindia"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snets3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "prod_rg"
    location             = "centralindia"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.2.0/26"]
  }
}

bastion = {
  bastion1 = {
    name                 = "Azurebastion"
    pip_name             = "bastion_pip"
    resource_group_name  = "prod_rg"
    virtual_network_name = "prod_vnet"
    location             = "centralindia"
    subnet_name          = "AzureBastionSubnet"


  }
}
network_security_group = {
  nsg1 = {
    name                 = "frontend_nsg"
    resource_group_name  = "prod_rg"
    location             = "centralindia"
    subnet_name          = "frontend_subnet"
    virtual_network_name = "prod_vnet"

  }
  nsg2 = {
    name                 = "backend_nsg"
    resource_group_name  = "prod_rg"
    location             = "centralindia"
    subnet_name          = "backend_subnet"
    virtual_network_name = "prod_vnet"

  }
}
public_ip = {
  pip1={
    name="mypip"
    resource_group_name="prod_rg"
    location="centralindia"
    
  }
}
network_interface_card = {
  nic1 = {
    name                 = "frontend_nic"
    resource_group_name  = "prod_rg"
    location             = "centralindia"
    subnet_name          = "frontend_subnet"
    virtual_network_name = "prod_vnet"
    pip_name="frontend_pip"

  }
  nic2 = {
    name                 = "backend_nic"
    resource_group_name  = "prod_rg"
    location             = "centralindia"
    subnet_name          = "backend_subnet"
    virtual_network_name = "prod_vnet"
    pip_name="backend_pip"

  }
}

virtual_machine = {
  vm1 = {
    name                             = "frontend_vm"
    resource_group_name              = "prod_rg"
    nic_name="frontend_vm"
    location                         = "centralindia"
    size                             = "Standard_D2s_v3"
    admin_username                   = "admin@123"
    admin_password                   = "admin@123456"
    os_disk_caching                  = "ReadWrite"
    os_disk_storage_account_type     = "Standard_LRS"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_sku       = "2016-Datacenter"
    source_image_reference_version   = "latest"
  }
  vm2 = {
    name                             = "backend_vm"
    resource_group_name              = "prod_rg"
    nic_name="backend_vm"
    location                         = "centralindia"
    size                             = "Standard_D2s_v3"
    admin_username                   = "admin@123"
    admin_password                   = "admin@123456"
    os_disk_caching                  = "ReadWrite"
    os_disk_storage_account_type     = "Standard_LRS"
    source_image_reference_offer     = "WindowsServer"
    source_image_reference_publisher = "MicrosoftWindowsServer"
    source_image_reference_sku       = "2016-Datacenter"
    source_image_reference_version   = "latest"
  }
}