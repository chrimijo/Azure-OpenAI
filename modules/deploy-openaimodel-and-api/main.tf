/*
Module: Azure Provider Configuration with Latest Version
This module sets up the Azure provider to use the latest version.
It specifies the Azure provider version as the latest available, 
allowing for the most recent features and improvements.
*/

terraform {
  required_version = ">= 1.4.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.97.1"
    }
 
  }
}