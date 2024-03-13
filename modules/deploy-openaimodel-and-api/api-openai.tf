# Deploy OpenAI model based on child'module input parameters
resource "azurerm_cognitive_deployment" "model" {
  name                 = "${var.AZURE_CD_PREFIX}-openai-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}-${var.SUFFIX}"
  cognitive_account_id = var.COGNITIVEACID
  model {
    format  = "OpenAI"
    name    = var.GPTMODEL
    version = var.GPTVERSION
  }
  scale {
    type = "Standard"
  }
}



# Deploy API to the model using an XML files get on 
resource "azurerm_api_management_api" "api-model" {
  name                  = "${var.AZURE_API_PREFIX}-${replace(var.GPTMODEL, "-", "")}${replace(var.GPTVERSION, "-", "")}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  resource_group_name   = var.RGNAME
  api_management_name   = var.APIMNGNAME
  revision              = "1"
  display_name          = "${var.AZURE_API_PREFIX}-${replace(var.GPTMODEL, "-", "")}${replace(var.GPTVERSION, "-", "")}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  protocols             = ["https"]
  service_url           = "${var.OPENAI_URL}openai"
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
  depends_on = [azurerm_cognitive_deployment.model]
}


#Create Subscription with the current OpenAI API
resource "azurerm_api_management_subscription" "openai-subscription" {
  resource_group_name = var.RGNAME
  api_management_name = var.APIMNGNAME
  product_id          = azurerm_api_management_product.openai-product.id
  display_name        = "subk-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  state               = "active"
  allow_tracing       = false
}


#Create a Product in APIM 
resource "azurerm_api_management_product" "openai-product" {
  product_id            = "prdt-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  resource_group_name   = var.RGNAME
  api_management_name   = var.APIMNGNAME
  display_name          = "prdt-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  description           = "prdt-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}-${trim(var.API_DEF_FILE_NAME, "AzureOpenAI-.json")}"
  subscription_required = true
  approval_required     = false
  published             = true
}

#Associate Product with the current OpenAI API
resource "azurerm_api_management_product_api" "openai-product-api" {
  api_name            = azurerm_api_management_api.api-model.name
  product_id          = azurerm_api_management_product.openai-product.product_id
  api_management_name = var.APIMNGNAME
  resource_group_name = var.RGNAME
}

resource "azurerm_api_management_api_policy" "api_policy" {
  api_name            = azurerm_api_management_api.api-model.name
  api_management_name = var.APIMNGNAME
  resource_group_name = var.RGNAME
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