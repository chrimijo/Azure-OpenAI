/*
Module: Network Configuration
This module is responsible for setting up the network configuration in Azure.
It includes the creation of a network security group (NSG), a virtual network (VNet), 
and two subnets for the Azure API Management service and the Azure endpoint.
*/


# Create a virtual network (VNet) for the Azure resources
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.AZURE_VNET_PREFIX}-${local.suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags                = local.DEFAULT_TAGS
}

# Create a subnet for the Azure API Management service
resource "azurerm_subnet" "sub-apim" {
  name                 = "${var.AZURE_SNET_PREFIX}-apimanagement"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a subnet for the Azure endpoint
resource "azurerm_subnet" "sub-endpoint" {
  name                 = "${var.AZURE_SNET_PREFIX}-endpoint"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create a public IP address for the Azure API Management service
resource "azurerm_public_ip" "pip-public" {
  name                = "${var.AZURE_PIP_PREFIX}-apim-${local.suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  domain_name_label   = "apim-${local.suffix}"
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.DEFAULT_TAGS
}