/*
Module: Azure Log Analytics Workspace Configuration
This module is responsible for creating and configuring an Azure Log Analytics Workspace.
It includes the creation of the workspace with a custom name, location, and SKU.
It also sets up the workspace to disable internet ingestion and enable internet query.
*/

resource "azurerm_log_analytics_workspace" "log" {
  name                       = "${var.AZURE_LOG_PREFIX}-${local.suffix}"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  sku                        = "PerGB2018"
  retention_in_days          = 90
  internet_ingestion_enabled = false
  internet_query_enabled     = true
  tags                       = local.DEFAULT_TAGS
}

#add query package @chrimijo