### VMA in vnet1 ###

resource "azurerm_network_interface" "nic_vmA" {
  name                = "${var.prefix}-nicA"
  location            = azurerm_resource_group.vnetA_rg.location
  resource_group_name = azurerm_resource_group.vnetA_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vnetA_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vmA" {
  name                  = "${var.prefix}-vmA"
  location              = azurerm_resource_group.vnetA_rg.location
  resource_group_name   = azurerm_resource_group.vnetA_rg.name
  network_interface_ids = [azurerm_network_interface.nic_vmA.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vmA"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.prefix}-A"
  }
}

### VMB in vnet1 ###

resource "azurerm_network_interface" "nic_vmB" {
  name                = "${var.prefix}-nicB"
  location            = azurerm_resource_group.vnetB_rg.location
  resource_group_name = azurerm_resource_group.vnetB_rg.name

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = azurerm_subnet.vnetB_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vmB" {
  name                  = "${var.prefix}-vmB"
  location              = azurerm_resource_group.vnetB_rg.location
  resource_group_name   = azurerm_resource_group.vnetB_rg.name
  network_interface_ids = [azurerm_network_interface.nic_vmB.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vmB"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.prefix}-B"
  }
}