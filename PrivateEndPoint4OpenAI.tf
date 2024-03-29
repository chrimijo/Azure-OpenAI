#####################################################
######### Build Private EndPoint for OpenAI #########
#####################################################

# ref:
# reference https://github.com/hashicorp/terraform-provider-azurerm/blob/main/examples/private-endpoint/private-link-scope/main.tf
# https://msandbu.org/deploy-azure-openai-using-terraform-with-private-endpoint/

resource "azurerm_private_dns_zone" "dnszone-openai" {
  name                = "privatelink.openai.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.DEFAULT_TAGS
}

resource "azurerm_private_dns_zone_virtual_network_link" "pl" {
  name                  = "${var.AZURE_PL_PREFIX}-openai-${local.suffix}"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dnszone-openai.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  tags                  = var.DEFAULT_TAGS
}

resource "azurerm_private_endpoint" "pep" {
  name                          = "${var.AZURE_PEP_PREFIX}-openai-${local.suffix}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  subnet_id                     = azurerm_subnet.sub-endpoint.id
  tags                          = var.DEFAULT_TAGS
  custom_network_interface_name = "${var.AZURE_NIC_PREFIX}-openai-${var.AZURE_PEP_PREFIX}-${local.suffix}"

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnszone-openai.id]
  }

  private_service_connection {
    name                           = "${var.AZURE_PSC_PREFIX}-openai-${local.suffix}"
    private_connection_resource_id = azurerm_cognitive_account.cognitive.id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }
}

