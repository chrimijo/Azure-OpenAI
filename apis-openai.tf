module "deploy-openai-model-2-apim" {
  source = "./modules/deploy-openai-model-2-apim"

  GPTMODEL   = "gpt-35-turbo"
  GPTVERSION = "0301"

  AZURE_CD_PREFIX   = var.AZURE_CD_PREFIX
  AZURE_API_PREFIX  = var.AZURE_API_PREFIX
  AZURE_APIM_PREFIX = var.AZURE_APIM_PREFIX
  API_DEF_FILE_NAME = "AzureOpenAI-2023-03-15-preview-inference.json"
  COGNITIVEACID     = azurerm_cognitive_account.cognitive.id
  SUFFIX            = local.suffix
  RGNAME            = azurerm_resource_group.rg.name
  APIMNGNAME        = azurerm_api_management.apim.name
  OPENAI_URL        = data.azurerm_cognitive_account.cognitive.endpoint
  depends_on        = [azurerm_api_management.apim]
}
