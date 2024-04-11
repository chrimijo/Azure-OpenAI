/*
Module: Azure API Management Deployment
This module is used to deploy and configure an Azure API Management instance. 
It includes the creation of the API Management resource, configuration of its virtual network,
enabling of system-assigned identity, and assignment of the 'Cognitive Services OpenAI User' role.
*/

# Deploy the API Management resource
resource "azurerm_api_management" "apim" {
  name                          = "${var.AZURE_APIM_PREFIX}-${local.suffix}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  publisher_name                = var.COMPANY
  publisher_email               = var.COMPANY-EMAIL
  tags                          = local.DEFAULT_TAGS
  sku_name                      = "Developer_1"
  public_ip_address_id          = azurerm_public_ip.pip-public.id
  public_network_access_enabled = true
  virtual_network_type          = "External"

  # Configure the virtual network for API Management
  virtual_network_configuration {
    subnet_id = azurerm_subnet.sub-apim.id
  }

  # Enable system-assigned identity so that the API Management resource can access other Azure resources like OpenAI
  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_subnet_network_security_group_association.nsg-asso-apim]
}

# Retrieve data for the current Azure subscription
data "azurerm_subscription" "current" {
}

# Assign a role to the API Management resource
resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_cognitive_account.cognitive.id
  role_definition_name = "Cognitive Services OpenAI User"
  principal_id         = azurerm_api_management.apim.identity[0].principal_id
}

# Deploy API to the model using an XML files get on 
resource "azurerm_api_management_api" "api-model" {
  name                  = "${var.AZURE_API_PREFIX}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  resource_group_name   = azurerm_resource_group.rg.name
  api_management_name   = azurerm_api_management.apim.name
  revision              = "1"
  display_name          = "${var.AZURE_API_PREFIX}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  protocols             = ["https"]
  service_url           = "${azurerm_cognitive_account.cognitive.endpoint}openai"
  path                  = "openai"
  subscription_required = true

  subscription_key_parameter_names {
    header = "Api-Key"
    query  = "subscription-key"
  }
  import {
    content_format = "openapi"
    content_value  = file("./api-definitions-files/${var.API_DEF_FILE_NAME}")
  }
}

resource "azurerm_api_management_api_policy" "api_policy" {
  api_name            = azurerm_api_management_api.api-model.name
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name
  xml_content         = <<-XML
<policies>
    <inbound>
        <base />
        <authentication-managed-identity resource="https://cognitiveservices.azure.com" />
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML
}