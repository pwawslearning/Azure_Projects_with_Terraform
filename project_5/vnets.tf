### VnetA resources ###

resource "azurerm_resource_group" "vnetA_rg" {
  name     = "${var.prefix}-A"
  location = var.location[0]
}

resource "azurerm_virtual_network" "vnetA" {
  name                = "vnetA"
  resource_group_name = azurerm_resource_group.vnetA_rg.name
  address_space       = [var.address_space[0]]
  location            = azurerm_resource_group.vnetA_rg.location
}
resource "azurerm_subnet" "vnetA_subnet" {
  name                 = "vnetA_subnet01"
  resource_group_name  = azurerm_resource_group.vnetA_rg.name
  virtual_network_name = azurerm_virtual_network.vnetA.name
  address_prefixes     = cidrsubnets(var.address_space[0], 8, 1)
}

### VnetB resources ###

resource "azurerm_resource_group" "vnetB_rg" {
  name     = "${var.prefix}-B"
  location = var.location[1]
}

resource "azurerm_virtual_network" "vnetB" {
  name                = "vnetB"
  resource_group_name = azurerm_resource_group.vnetB_rg.name
  address_space       = [var.address_space[1]]
  location            = azurerm_resource_group.vnetB_rg.location
}
resource "azurerm_subnet" "vnetB_subnet" {
  name                 = "vnetB_subnet01"
  resource_group_name  = azurerm_resource_group.vnetB_rg.name
  virtual_network_name = azurerm_virtual_network.vnetB.name
  address_prefixes     = cidrsubnets(var.address_space[1], 8, 1)
}


### VNET peering ###

resource "azurerm_virtual_network_peering" "VNETA_TO_VNETB" {
  name                      = "peerVNETAtoVNETB"
  resource_group_name       = azurerm_resource_group.vnetA_rg.name
  virtual_network_name      = azurerm_virtual_network.vnetA.name
  remote_virtual_network_id = azurerm_virtual_network.vnetB.id
}

resource "azurerm_virtual_network_peering" "VNETB_TO_VNETA" {
  name                      = "peerVNETBtoVNETA"
  resource_group_name       = azurerm_resource_group.vnetB_rg.name
  virtual_network_name      = azurerm_virtual_network.vnetB.name
  remote_virtual_network_id = azurerm_virtual_network.vnetA.id
}