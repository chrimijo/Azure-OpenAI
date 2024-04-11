/*
Module: Azure OpenAI Cognitive Account Configuration
This module is responsible for creating and configuring an Azure Cognitive Account for OpenAI. 
It includes the creation of the Cognitive Account with a custom subdomain, disabling public network access,
and setting up network ACLs to deny all traffic by default.
ref:  https://msandbu.org/deploy-azure-openai-using-terraform-with-private-endpoint/
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
  tags                          = local.DEFAULT_TAGS

  network_acls {
    default_action = "Deny"
  }

}

# Read Data to get the api-key call in apimmng.tf
# data "azurerm_cognitive_account" "cognitive" {
#   name                = "${var.AZURE_CA_PREFIX}-openai-${local.suffix}"
#   resource_group_name = azurerm_resource_group.rg.name
#   depends_on = [ azurerm_cognitive_account.cognitive]
# }

