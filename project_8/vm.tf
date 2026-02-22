// Create resource group for vm
resource "azurerm_resource_group" "vm_rg" {
  name     = "rg-${var.proj}-${var.env}"
  location = var.location
}

// Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vm-${var.proj}-${var.env}"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  address_space       = [var.cidr]
}

// Subnet for VM
resource "azurerm_subnet" "vm-sub01" {
  name                 = "sub-${var.proj}-${var.env}"
  resource_group_name  = azurerm_resource_group.vm_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.cidr, 4, 0)]
}

// Public IP to access VM
resource "azurerm_public_ip" "vm-pip" {
  name                = "pip-vm-${var.proj}-${var.env}"
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  allocation_method   = "Static"
}


//Security Group for VM
resource "azurerm_network_security_group" "vm-nsg" {
  name                = "nsg-${var.proj}-${var.env}-vm"
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

// create network interface
resource "azurerm_network_interface" "vm-nic" {
  name                = "nic-${var.proj}${var.env}vm"
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.vm-sub01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm-pip.id
  }
}

// Network interface associate with network security group

resource "azurerm_network_interface_security_group_association" "nicasso" {
  network_interface_id      = azurerm_network_interface.vm-nic.id
  network_security_group_id = azurerm_network_security_group.vm-nsg.id
}

// create virtual machine

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.proj}${var.env}vm"
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  size                = "Standard_B1s"

  admin_username = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm-nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.ssh.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt install nginx -y",

#       # Create a sample welcome page
#       "echo '<html><body><h1>#Monitoring test project!</h1></body></html>' | sudo tee /var/www/html/index.html",

#       # Ensure nginx is running
#       "sudo systemctl start nginx",
#       "sudo systemctl enable nginx"
#     ]
#     connection {
#       type        = "ssh"
#       private_key = tls_private_key.ssh.private_key_openssh
#       user        = "adminuser"
#       host        = azurerm_public_ip.vm-pip.ip_address
#     }
#   }
}