/*
Module: Deploy OpenAI Model to Azure API Management
This module is used to deploy an OpenAI model to Azure API Management.
It includes the configuration for the Azure Cognitive Services account,
the API Management service, and the OpenAI model details.
*/

module "deploy-openai-model-2-apim" {
  source = "./modules/deploy-openaimodel-and-api"

  AZURE_CD_PREFIX   = var.AZURE_CD_PREFIX
  AZURE_API_PREFIX  = var.AZURE_API_PREFIX
  AZURE_APIM_PREFIX = var.AZURE_APIM_PREFIX
  COGNITIVEACID     = azurerm_cognitive_account.cognitive.id
  SUFFIX            = local.suffix
  RGNAME            = azurerm_resource_group.rg.name
  APIMNGNAME        = azurerm_api_management.apim.name
  APINAME           = azurerm_api_management_api.api-model.name
  OPENAI_URL        = azurerm_cognitive_account.cognitive.endpoint
  depends_on        = [azurerm_api_management.apim]

  for_each = var.OpenAI-Model

  GPTMODEL      = each.value.GPTMODEL
  GPTVERSION    = each.value.GPTVERSION
  APP_CONSUMING = each.value.APP_CONSUMING
}

variable "OpenAI-Model" {
  description = "Settings to add a API in APIM and build associate OpenAi model"
  type        = map(any)
  default = {
    mod1 = {
      GPTMODEL      = "gpt-4"
      GPTVERSION    = "1106-Preview"
      APP_CONSUMING = "botcmb"
    },
    mod2 = {
      GPTMODEL      = "gpt-35-turbo"
      GPTVERSION    = "0301"
      APP_CONSUMING = "botcmb"
    },

    mod3 = {
      GPTMODEL      = "gpt-4"
      GPTVERSION    = "0613"
      APP_CONSUMING = "botcmb"
    },
    mod4 = {
      GPTMODEL      = "gpt-4"
      GPTVERSION    = "1106-Preview"
      APP_CONSUMING = "botcmso"

    },
    mod5 = {
      GPTMODEL      = "gpt-35-turbo"
      GPTVERSION    = "0301"
      APP_CONSUMING = "botcmso"

    },

    mod6 = {
      GPTMODEL      = "gpt-4"
      GPTVERSION    = "0613"
      APP_CONSUMING = "botcmso"
    },

  }
  validation {
    condition     = length(var.OpenAI-Model) > 0
    error_message = "The Default Tags variable cannot be empty"
  }
}
