
/* Build OpenAI Cognitive Service

ref:
https://msandbu.org/deploy-azure-openai-using-terraform-with-private-endpoint/
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment
 */

resource "azurerm_cognitive_account" "cognitive" {
  name                          = "${var.AZURE_CA_PREFIX}-openai-${local.suffix}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = false
  custom_subdomain_name         = "openai-${local.suffix}"
  tags                          = var.DEFAULT_TAGS

  network_acls {
    default_action = "Deny"
  }

}

# Read Data to get the api-key call in apimmng.tf
data "azurerm_cognitive_account" "cognitive" {
  name                = "${var.AZURE_CA_PREFIX}-openai-${local.suffix}"
  resource_group_name = azurerm_resource_group.rg.name
}

