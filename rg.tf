########################################
######### Build Resource Group #########
########################################

resource "azurerm_resource_group" "rg" {
  name     = "${var.AZURE_RG_PREFIX}-${local.suffix}"
  location = var.AZURE_REGION
  tags     = var.DEFAULT_TAGS
}