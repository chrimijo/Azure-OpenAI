########################################
######### Build API Management #########
########################################

#ref
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management

resource "azurerm_api_management" "apim" {
  name                          = "${var.AZURE_APIM_PREFIX}-${local.suffix}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  publisher_name                = var.COMPANY
  publisher_email               = var.COMPANY-EMAIL
  tags                          = var.DEFAULT_TAGS
  sku_name                      = "Developer_1"
  public_ip_address_id          = azurerm_public_ip.pip-public.id
  public_network_access_enabled = true
  virtual_network_type          = "External"

  virtual_network_configuration {
    subnet_id = azurerm_subnet.sub-apim.id
  }

  identity {
    type = "SystemAssigned"

  }
  depends_on = [azurerm_subnet_network_security_group_association.nsg-asso-apim]
}

data "azurerm_subscription" "current" {
}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_cognitive_account.cognitive.id
  role_definition_name = "Cognitive Services OpenAI User"
  principal_id         = azurerm_api_management.apim.identity[0].principal_id
}
