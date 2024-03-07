

# # Create network interface
# resource "azurerm_network_interface" "my_terraform_nic" {
#   name                = "${var.AZURE_NIC_PREFIX}-win11-${local.suffix}"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "my_nic_configuration"
#     subnet_id                     = azurerm_subnet.sub-apim.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.pip-win11.id
#   }
# }


# # Create storage account for boot diagnostics
# resource "azurerm_storage_account" "my_storage_account" {
#   name                     = "diagwin11arkea"
#   location                 = azurerm_resource_group.rg.location
#   resource_group_name      = azurerm_resource_group.rg.name
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }


# # Create virtual machine
# resource "azurerm_windows_virtual_machine" "win11" {
#   name                  = "vm-win11-${local.suffix}"
#   computer_name         = "vm-win11"
#   admin_username        = "superman"
#   admin_password        = "@2#cWHf3oFCJP$2K6ezUBJumIIL2SyNRMIJx0h1e"
#   location              = azurerm_resource_group.rg.location
#   resource_group_name   = azurerm_resource_group.rg.name
#   network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
#   size                  = "Standard_D2s_v3"
#   tags                  = var.default_tags

#   os_disk {
#     name                 = "myOsDisk"
#     caching              = "ReadWrite"
#     storage_account_type = "Premium_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsDesktop"
#     offer     = "windows-11"
#     sku       = "win11-21h2-avd"
#     version   = "latest"
#   }

#   boot_diagnostics {
#     storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
#   }
# }

# resource "azurerm_dev_test_global_vm_shutdown_schedule" "rg" {
#   virtual_machine_id = azurerm_windows_virtual_machine.win11.id
#   location           = azurerm_resource_group.rg.location
#   enabled            = true

#   daily_recurrence_time = "2000"
#   timezone              = "Romance Standard Time" # France, Paris time zone https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/

#   notification_settings {
#     enabled = false
#   }
# }