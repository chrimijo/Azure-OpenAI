/*
Module: Azure Provider and Backend Configuration
This module sets up the required provider and backend for Terraform to manage resources in Azure.
It specifies the Azure provider version, the backend for storing the Terraform state file, 
and the minimum required version of Terraform.
*/

/*
Module: Azure Provider, Backend, and Resource Group Configuration
This module sets up the required provider and backend for Terraform to manage resources in Azure,
and creates an Azure Resource Group.
It specifies the Azure provider version, the backend for storing the Terraform state file,
the minimum required version of Terraform, and the creation of the resource group with a custom name,
location, and tags.
*/

terraform {

  required_version = ">= 1.4.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.97.1"
    }
  }

   backend "azurerm" {
    resource_group_name  = "rg-rec-iac-frct"
    storage_account_name = "streciacfrct"
    container_name       = "tfstate"
    key                  = "rec-iac-frct.tfstate"
  } 
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.AZURE_RG_PREFIX}-${local.suffix}"
  location = var.AZURE_REGION
  tags     = local.DEFAULT_TAGS
}