#################################################
######### Build Log Analytics Workspace #########
#################################################

# Creates Log Anaylytics Workspace
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace

resource "azurerm_log_analytics_workspace" "log" {
  name                       = "${var.AZURE_LOG_PREFIX}-${local.suffix}"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  sku                        = "PerGB2018"
  retention_in_days          = 90
  internet_ingestion_enabled = false
  internet_query_enabled     = true
  tags                       = var.DEFAULT_TAGS
}

#add query package @chrimijo