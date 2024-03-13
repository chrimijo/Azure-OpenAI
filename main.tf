terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-daei-di01-rec-iac-frct"
    storage_account_name = "stdaeidi01reciacfrct"
    container_name       = "tfstate"
    key                  = "openai-rec.tfstate"
  }
  required_version = ">=1.7.4"
}

provider "azurerm" {
  features {}
}