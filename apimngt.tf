########################################
######### Build API Management #########
########################################

#ref
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management


resource "azurerm_api_management" "apim" {
  name                          = "${var.AZURE_APIM_PREFIX}-${local.suffix}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  publisher_name                = "INNOVAMIS"
  publisher_email               = "christian.joseph@innovamis.com"
  tags                          = var.default_tags
  sku_name                      = "Developer_1"
  public_ip_address_id          = azurerm_public_ip.pip-public.id
  public_network_access_enabled = true
  virtual_network_type          = "External"

  virtual_network_configuration {
    subnet_id = azurerm_subnet.sub-apim.id
  }
  depends_on = [azurerm_subnet_network_security_group_association.nsg-asso-apim ]
 }

resource "azurerm_api_management_api" "api-openai" {
  name                = "${var.AZURE_API_PREFIX}-openai-${local.suffix}"
  resource_group_name = azurerm_resource_group.rg.location
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "OpenAI"
  path                = "example"
  protocols           = ["https"]
  service_url         = "https://apim-conversationel-prod-weu.azure-api.net"
  
  import {
    content_format = "swagger-link-json"
    content_value  = "https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/specification/cognitiveservices/data-plane/AzureOpenAI/inference/preview/2023-03-15-preview/inference.json"
    }
 }