/*
Module: Azure Cognitive Deployment and API Management Configuration for OpenAI
This module is responsible for deploying an OpenAI model and setting up an API
for it using Azure Cognitive Services and API Management. 
It includes the creation of a cognitive deployment resource and an API management API resource,
with the API definition imported from a local file.
*/


# Deploy OpenAI model based on child'module input parameters
resource "azurerm_cognitive_deployment" "model" {
  name                 = "${var.AZURE_CD_PREFIX}-${var.APP_CONSUMING}-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}-${var.SUFFIX}"
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

#Create a Product in APIM 
resource "azurerm_api_management_product" "openai-product" {
  product_id            = "prdt-${var.APP_CONSUMING}-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}"
  description           = "OpenAI Product for ${var.GPTMODEL} ${var.GPTVERSION} used by ${var.APP_CONSUMING}"
  resource_group_name   = var.RGNAME
  api_management_name   = var.APIMNGNAME
  display_name          = "prdt-${var.APP_CONSUMING}-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}"
  subscription_required = true
  approval_required     = false
  published             = true
}


#Create Subscription with the current OpenAI API
resource "azurerm_api_management_subscription" "openai-subscription" {
  resource_group_name = var.RGNAME
  api_management_name = var.APIMNGNAME
  product_id          = azurerm_api_management_product.openai-product.id
  display_name        = "subk-${var.APP_CONSUMING}-${replace(var.GPTMODEL, "-", "")}-${replace(var.GPTVERSION, "-", "")}"
  state               = "active"
  allow_tracing       = false
}

#Associate Product with the current OpenAI API
resource "azurerm_api_management_product_api" "openai-product-api" {
  api_name            = var.APINAME
  product_id          = azurerm_api_management_product.openai-product.product_id
  api_management_name = var.APIMNGNAME
  resource_group_name = var.RGNAME
}