module "deploy-openai-model-2-apim" {
  source = "./modules/deploy-openaimodel-and-api"

  AZURE_CD_PREFIX   = var.AZURE_CD_PREFIX
  AZURE_API_PREFIX  = var.AZURE_API_PREFIX
  AZURE_APIM_PREFIX = var.AZURE_APIM_PREFIX
  COGNITIVEACID     = azurerm_cognitive_account.cognitive.id
  SUFFIX            = local.suffix
  RGNAME            = azurerm_resource_group.rg.name
  APIMNGNAME        = azurerm_api_management.apim.name
  OPENAI_URL        = azurerm_cognitive_account.cognitive.endpoint
  depends_on        = [azurerm_api_management.apim]

  for_each = var.OpenAI-Model

  GPTMODEL          = each.value.GPTMODEL
  GPTVERSION        = each.value.GPTVERSION
  API_DEF_FILE_NAME = each.value.API_DEF_FILE_NAME
}

/* module "deploy-openai-model-2-apim" {
  source = "./modules/deploy-openaimodel-and-api"

  GPTMODEL   = "gpt-4"
  GPTVERSION = "0613"

  AZURE_CD_PREFIX   = var.AZURE_CD_PREFIX
  AZURE_API_PREFIX  = var.AZURE_API_PREFIX
  AZURE_APIM_PREFIX = var.AZURE_APIM_PREFIX
  API_DEF_FILE_NAME = "AzureOpenAI-2024-03-01-preview.json"
  COGNITIVEACID     = azurerm_cognitive_account.cognitive.id
  SUFFIX            = local.suffix
  RGNAME            = azurerm_resource_group.rg.name
  APIMNGNAME        = azurerm_api_management.apim.name
  OPENAI_URL        = data.azurerm_cognitive_account.cognitive.endpoint
  depends_on        = [azurerm_api_management.apim]
} */
