#################################
######### Build Network #########
#################################


resource "azurerm_network_security_group" "nsg" {
  name                = "${var.AZURE_NSG_PREFIX}-${local.suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.default_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.AZURE_VNET_PREFIX}-${local.suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags                = var.default_tags
}

resource "azurerm_subnet" "sub-apim" {
  name                 = "${var.AZURE_SNET_PREFIX}-apimanagement"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_subnet" "sub-endpoint" {
  name                 = "${var.AZURE_SNET_PREFIX}-endpoint"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]

}

resource "azurerm_public_ip" "pip-public" {
  name                = "${var.AZURE_PIP_PREFIX}-apim-${local.suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  domain_name_label   = "cma-pip"
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.default_tags
}

resource "azurerm_public_ip" "pip-private" {
  name                = "${var.AZURE_PIP_PREFIX}-apimmgt-${local.suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  domain_name_label   = "cma-mngt"
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.default_tags

}

# Create public IPs for windows 11 vm
resource "azurerm_public_ip" "pip-win11" {
  name                = "${var.AZURE_PIP_PREFIX}-win11-${local.suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}