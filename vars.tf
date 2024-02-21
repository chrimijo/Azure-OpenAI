####################################
######### Define variables #########
####################################

#
variable "AZURE_REGION" {
  type    = string
  default = "francecentral"
  validation {
    condition     = contains(["francecentral", "westeurope", "northeurope", "southfrance"], var.AZURE_REGION)
    error_message = "The region must be either francecentral, westeurope, northeurope, southfrance"
  }
}

variable "AZURE_ENV" {
  type    = string
  default = "dev"
  validation {
    condition     = contains(["dev", "test", "prod"], var.AZURE_ENV)
    error_message = "The environment must be either dev, test, prod"
  }
}

variable "AZURE_REGION_TRIG" {
  type = map(string)
  default = {
    francecentral = "frct"
    westeurope    = "weu"
    northeurop    = "neu"
    southfrance   = "sfr"
  }
}

locals {
  suffix = "${var.AZURE_APP_NAME}-${var.AZURE_ENV}-${var.AZURE_REGION_TRIG["${var.AZURE_REGION}"]}"
}

# Prefix variables
variable "AZURE_APP_NAME" {
  type = string
  validation {
    condition     = length(var.AZURE_APP_NAME) > 0
    error_message = "The Azure root name cannot be empty"
  }
}

variable "AZURE_RG_PREFIX" {
  type    = string
  default = "rg"
}

variable "AZURE_NSG_PREFIX" {
  type    = string
  default = "nsg"
}

variable "AZURE_VNET_PREFIX" {
  type    = string
  default = "vnet"
}

variable "AZURE_LOG_PREFIX" {
  type    = string
  default = "vnet"
}

variable "AZURE_PIP_PREFIX" {
  type    = string
  default = "pip"
}

variable "AZURE_PEP_PREFIX" {
  type    = string
  default = "pep"
}

variable "AZURE_SNET_PREFIX" {
  type    = string
  default = "snet"
}

variable "AZURE_AMPLS_PREFIX" {
  type    = string
  default = "ampls"
}

variable "AZURE_PSC_PREFIX" {
  type    = string
  default = "psc"
}

variable "AZURE_NIC_PREFIX" {
  type    = string
  default = "nic"
}

variable "AZURE_CA_PREFIX" {
  type    = string
  default = "ca"
}

variable "AZURE_CD_PREFIX" {
  type    = string
  default = "cd"
}

variable "AZURE_PL_PREFIX" {
  type    = string
  default = "pl"
}

variable "AZURE_APIM_PREFIX" {
  type    = string
  default = "apim"
}

variable "AZURE_API_PREFIX" {
  type    = string
  default = "api"
}

# Tag variables
variable "AZURE_DEP" {
  type = string
  validation {
    condition     = length(var.AZURE_DEP) > 0
    error_message = "The Deployment cannot be empty"
  }
}

variable "AZURE_PO" {
  type = string
  validation {
    condition     = length(var.AZURE_PO) > 0
    error_message = "The Deployment cannot be empty"
  }
}

### A TRANSFORMER EN POLICY ###
variable "default_tags" {
  type = map(string)
  default = {
    Environment  = "Production"
    ProductOwner = "CJO"
    Departement  = "AEIS"
  }
}