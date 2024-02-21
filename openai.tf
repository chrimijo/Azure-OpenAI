########################################
######### Build OpenAI Service #########
########################################

# ref:
# https://msandbu.org/deploy-azure-openai-using-terraform-with-private-endpoint/
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment

resource "azurerm_cognitive_account" "cognitive" {
  name                          = "${var.AZURE_CA_PREFIX}-openai-${local.suffix}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = false
  custom_subdomain_name         = "innovamis-openai"
  tags                          = var.default_tags
}

resource "azurerm_cognitive_deployment" "example" {
  name                 = "${var.AZURE_CD_PREFIX}-openai-${local.suffix}"
  cognitive_account_id = azurerm_cognitive_account.cognitive.id

  model {
    format  = "OpenAI"
    name    = "gpt-35-turbo"
    version = "0301"
  }

  scale {
    type = "Standard"
  }
}
