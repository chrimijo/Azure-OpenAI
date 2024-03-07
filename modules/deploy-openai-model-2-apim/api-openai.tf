resource "azurerm_cognitive_deployment" "model" {
 name                 = "${var.AZURE_CD_PREFIX}-openai-${var.SUFFIX}"
 cognitive_account_id = "${var.COGNITIVEACID}"

  model {
    format  = "OpenAI"
    name    = "${var.GPTMODEL}"
    version = "${var.GPTVERSION}"
  }
  scale {
    type = "Standard"
  }
}

resource "azurerm_api_management_api" "api-model" {
  name                  = "${var.AZURE_API_PREFIX}-openai-${trim(var.GPTMODEL,"-")}-${trim(var.GPTVERSION,"-")}"
  resource_group_name   = var.RGNAME
  api_management_name   = var.APIMNGNAME
  revision              = "1"
  display_name          = "${var.AZURE_API_PREFIX}-openai-${trim(var.GPTMODEL,"-")}-${trim(var.GPTVERSION,"-")}"
  protocols             = ["https"]
  service_url           = "https://${var.AZURE_APIM_PREFIX}-${var.SUFFIX}.azure-api.net"
  subscription_required = true

  subscription_key_parameter_names {
    header = "Api-Key"
    query  = "subscription-key"
  }

  import {
    content_format = "openapi"
    content_value  = file("AzureOpenAI-2023-03-15-preview-inference.json")
  }
  depends_on = [azurerm_cognitive_deployment.model]
}

resource "azurerm_api_management_product" "openai-product" {
  product_id            = "openai-product"
  resource_group_name   = var.RGNAME
  api_management_name   = var.APIMNGNAME
  display_name          = "openai-product"
  description           = "openai-product"
  subscription_required = true
  approval_required     = false
  published             = true
}

resource "azurerm_api_management_subscription" "openai-subscription" {
  resource_group_name = var.RGNAME
  api_management_name = var.APIMNGNAME
  product_id          = azurerm_api_management_product.openai-product.id
  display_name        = "openai-subscription-key"
  allow_tracing = false
}

resource "azurerm_api_management_api_policy" "api_policy" {
  api_name            = azurerm_api_management_api.api-model.name
  api_management_name = var.APIMNGNAME
  resource_group_name = var.RGNAME
  
  xml_content = <<XML

<policies>
    <inbound>
        <base />
        <set-header name="api-key" exists-action="override">
            <value>{{openai-key}}</value>
        </set-header>
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