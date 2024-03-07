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
  tags                          = var.default_tags
  sku_name                      = "Developer_1"
  public_ip_address_id          = azurerm_public_ip.pip-public.id
  public_network_access_enabled = true
  virtual_network_type          = "External"

  virtual_network_configuration {
    subnet_id = azurerm_subnet.sub-apim.id
  }
  depends_on = [azurerm_subnet_network_security_group_association.nsg-asso-apim]
}

# create Named Valu
resource "azurerm_api_management_named_value" "named-value" {
  name                = "openai-backend-api-key"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = "openai-backend-api-key"
  secret              = true
  value               = data.azurerm_cognitive_account.cognitive.primary_access_key
  depends_on          = [azurerm_cognitive_account.cognitive]
}

