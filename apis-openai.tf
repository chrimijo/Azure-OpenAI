module "deploy-openai-model-2-apim" {
  source = "./modules/deploy-openai-model-2-apim"

  GPTMODEL        = "gpt-35-turbo"
  GPTVERSION      = "0301"
  AZURE_CD_PREFIX = var.AZURE_CD_PREFIX

  COGNITIVEACID     = azurerm_cognitive_account.cognitive.id
  AZURE_API_PREFIX  = var.AZURE_API_PREFIX
  AZURE_APIM_PREFIX = var.AZURE_APIM_PREFIX
  SUFFIX            = local.suffix
  RGNAME            = azurerm_resource_group.rg.name
  APIMNGNAME        = azurerm_api_management.apim.name
  depends_on        = [azurerm_api_management.apim]
}
