resource "azurerm_virtual_network" "vnet" {
  name = "vnet-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  address_space = [var.address_space]
}

resource "azurerm_subnet" "subnet01" {
  name = "sub01-${var.resource01}-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = cidrsubnets(var.address_space,4,0)
}
resource "azurerm_subnet" "subnet02" {
  name = "sub02-${var.resource02}-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = cidrsubnets(var.address_space,4,16)
}
resource "azurerm_subnet" "subnet03" {
  name = "sub03-${var.resource03}-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = cidrsubnets(var.address_space,4,32)
}

resource "azurerm_subnet" "subnet04" {
  name = "sub04-${var.resource04}-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = cidrsubnets(var.address_space,4,48)
}

resource "azurerm_subnet" "subnet05" {
  name = "sub05-${var.resource05}-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = cidrsubnets(var.address_space,4,64)
}