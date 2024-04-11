/*
Module: Azure Private Endpoint Configuration for Azure Monitor
This module is responsible for creating and configuring a private endpoint for Azure Monitor.
It includes the creation of private DNS zones, a monitor private link scope,
and a private endpoint with a custom network interface. 
It also sets up a private service connection to the monitor private link scope.
*/

locals {
  private_dns_zones_names_monitor = toset([
    "privatelink.agentsvc.azure-automation.net",
    "privatelink.blob.core.windows.net",
    "privatelink.monitor.azure.com",
    "privatelink.ods.opinsights.azure.com",
    "privatelink.oms.opinsights.azure.com",
  ])
}

resource "azurerm_private_dns_zone" "dnszone-monitor" {
  for_each            = local.private_dns_zones_names_monitor
  name                = each.value
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.DEFAULT_TAGS
}

resource "azurerm_monitor_private_link_scope" "ampls" {
  name                = "${var.AZURE_AMPLS_PREFIX}-monitor-${local.suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.DEFAULT_TAGS
}

resource "azurerm_private_endpoint" "pepyes" {
  name                          = "${var.AZURE_PEP_PREFIX}-monitor-${local.suffix}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  subnet_id                     = azurerm_subnet.sub-endpoint.id
  tags                          = local.DEFAULT_TAGS
  custom_network_interface_name = "${var.AZURE_NIC_PREFIX}-monitor-${var.AZURE_PEP_PREFIX}-${local.suffix}"

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [for _, v in azurerm_private_dns_zone.dnszone-monitor : v.id]
  }

  private_service_connection {
    name                           = "${var.AZURE_PSC_PREFIX}-monitor-${local.suffix}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_monitor_private_link_scope.ampls.id
    subresource_names              = ["azuremonitor"]
  }
}

# reference https://github.com/hashicorp/terraform-provider-azurerm/blob/main/examples/private-endpoint/private-link-scope/main.tf