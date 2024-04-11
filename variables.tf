/*
Module: Terraform Variables for OpenAI Model Configuration
This module defines the variables used in the Terraform configuration
for setting up an OpenAI model in Azure API Management.
It includes variables for the default tags, the OpenAI model details,
and validation rules for these variables.
*/



variable "API_DEF_FILE_NAME" {
  type        = string
  description = "Variable to define the API definition file name"
  validation {
    condition     = length(var.API_DEF_FILE_NAME) > 0
    error_message = "The API_DEF_FILE_NAME variable cannot be empty"
  }
}

variable "AZURE_REGION" {
  type        = string
  default     = "francecentral"
  description = "Choose the target Azure Region francecentral, westeurope, northeurope and southfrance"
  validation {
    condition     = contains(["francecentral", "westeurope", "northeurope", "southfrance"], var.AZURE_REGION) && length(var.AZURE_REGION) > 0
    error_message = "The region must be either francecentral, westeurope, northeurope, southfrance"
  }
}

variable "PO" {
  type        = string
  description = "Define who is the Product Owner"
  validation {
    condition     = length(var.PO) > 0
    error_message = "PO variable cannot be empty"
  }
}

variable "AZURE_ENV" {
  type        = string
  default     = "dev"
  description = "Prefix use to define the environment: Developpement (dev), Recette (rec) or Production (prod)"
  validation {
    condition     = contains(["dev", "rec", "prod"], var.AZURE_ENV) && length(var.AZURE_ENV) > 0
    error_message = "The environment must be either dev, rec, prod"
  }
}

variable "AZURE_REGION_TRIG" {
  type        = map(string)
  description = "Trigram used in the ressource name for the target Azure Region, and based on the Azure Region choosed in variable AZURE_REGION"
  default = {
    francecentral = "frct"
    westeurope    = "weu"
    northeurop    = "neu"
    southfrance   = "sfr"
  }
  validation {
    condition     = length(var.AZURE_REGION_TRIG) > 0
    error_message = "The Azure root name cannot be empty"
  }
}

variable "COMPANY" {
  type        = string
  default     = "COMPANY"
  description = "Company named used for the API Management deployement"
  validation {
    condition     = length(var.COMPANY) > 0
    error_message = "The Azure root name cannot be empty"
  }
}

variable "COMPANY-EMAIL" {
  type        = string
  default     = "admin@company.com"
  description = "Email named used for the API Management deployement, this email is used for notifications"
  validation {
    condition     = length(var.COMPANY-EMAIL) > 0
    error_message = "The Azure root name cannot be empty"
  }
}

locals {
  suffix      = "${var.AZURE_DEP}-${var.AZURE_ENV}-${var.AZURE_APP_NAME}-${var.AZURE_REGION_TRIG["${var.AZURE_REGION}"]}"
  description = "Build a string sufix, with departement name of the company, the environnement, the application name and the target region"
}

# Prefix variables
variable "AZURE_APP_NAME" {
  type        = string
  default     = "openai"
  description = "Prefix for application name and must be less or equal to 6 caracters"
  validation {
    condition     = length(var.AZURE_APP_NAME) > 0 && length(var.AZURE_APP_NAME) <= 6
    error_message = "The Azure root name cannot be empty"
  }
}

variable "AZURE_RG_PREFIX" {
  type        = string
  default     = "rg"
  description = "Prefix for Ressource Group object"
  validation {
    condition     = length(var.AZURE_RG_PREFIX) > 0
    error_message = "The Azure Ressource Group prefix cannot be empty"
  }
}

variable "AZURE_NSG_PREFIX" {
  type        = string
  default     = "nsg"
  description = "Prefix for Network Security Group object"
  validation {
    condition     = length(var.AZURE_NSG_PREFIX) > 0
    error_message = "The Azure Network Security Group prefix cannot be empty"
  }
}

variable "AZURE_VNET_PREFIX" {
  type        = string
  default     = "vnet"
  description = "Prefix for Virtual Network object"
  validation {
    condition     = length(var.AZURE_VNET_PREFIX) > 0
    error_message = "The Azure Virtual Network prefix cannot be empty"
  }
}

variable "AZURE_LOG_PREFIX" {
  type        = string
  default     = "vnet"
  description = "Prefix for Log Analytics Workspace object"
  validation {
    condition     = length(var.AZURE_LOG_PREFIX) > 0
    error_message = "The Azure Log Analytics prefix cannot be empty"
  }
}

variable "AZURE_PIP_PREFIX" {
  type        = string
  default     = "pip"
  description = "Prefix for Public IP"
  validation {
    condition     = length(var.AZURE_PIP_PREFIX) > 0
    error_message = "The Azure Public IP prefix cannot be empty"
  }
}

variable "AZURE_PEP_PREFIX" {
  type        = string
  default     = "pep"
  description = "Prefix for Private EndPoint object"
  validation {
    condition     = length(var.AZURE_PEP_PREFIX) > 0
    error_message = "The Azure Private EndPoint prefix cannot be empty"
  }
}

variable "AZURE_SNET_PREFIX" {
  type        = string
  default     = "snet"
  description = "Prefix for SubNet object"
  validation {
    condition     = length(var.AZURE_SNET_PREFIX) > 0
    error_message = "The Azure Subnet prefix cannot be empty"
  }
}

variable "AZURE_AMPLS_PREFIX" {
  type        = string
  default     = "ampls"
  description = "Prefix for Azure Monitor Private Link Scope object"
  validation {
    condition     = length(var.AZURE_AMPLS_PREFIX) > 0
    error_message = "The Azure Monitor Private Link Scope prefix cannot be empty"
  }
}

variable "AZURE_PSC_PREFIX" {
  type        = string
  default     = "psc"
  description = "Prefix for Private Service Connection object"
  validation {
    condition     = length(var.AZURE_PSC_PREFIX) > 0
    error_message = "The Azure Private Service Connection prefix cannot be empty"
  }
}

variable "AZURE_NIC_PREFIX" {
  type        = string
  default     = "nic"
  description = "Prefix for Network Interface Connection object"
  validation {
    condition     = length(var.AZURE_NIC_PREFIX) > 0
    error_message = "The Azure Network Interface Connection prefix cannot be empty"
  }
}

variable "AZURE_CA_PREFIX" {
  type        = string
  default     = "ca"
  description = "Prefix for Cognitive Account object"
  validation {
    condition     = length(var.AZURE_CA_PREFIX) > 0
    error_message = "The Azure Cognitive Account prefix cannot be empty"
  }
}

variable "AZURE_CD_PREFIX" {
  type        = string
  default     = "cd"
  description = "Prefix for Cognitive Deployment"
  validation {
    condition     = length(var.AZURE_CD_PREFIX) > 0
    error_message = "The Azure Cognitive Deployment prefix cannot be empty"
  }
}

variable "AZURE_PL_PREFIX" {
  type        = string
  default     = "pl"
  description = "Prefix for Private Link object"
  validation {
    condition     = length(var.AZURE_PL_PREFIX) > 0
    error_message = "The Azure Private Link prefix cannot be empty"
  }
}

variable "AZURE_APIM_PREFIX" {
  type        = string
  default     = "apim"
  description = "Prefix for Azure API Management instance"
  validation {
    condition     = length(var.AZURE_APIM_PREFIX) > 0
    error_message = "The Azure API Management prefix cannot be empty"
  }
}

variable "AZURE_API_PREFIX" {
  type        = string
  default     = "api"
  description = "Prefix for API into Azure API instance"
  validation {
    condition     = length(var.AZURE_API_PREFIX) > 0
    error_message = "The Azure API prefix cannot be empty"
  }
}



variable "AZURE_DEP" {
  type        = string
  default     = "dep"
  description = "Prefix for department Owner of the OpenAI service"
  validation {
    condition     = length(var.AZURE_DEP) > 0
    error_message = "The Deployment variable cannot be empty"
  }
}

# Tag variables ----> A TRANSFORMER EN POLICY ?

locals {
  DEFAULT_TAGS = {
    Environment  = var.AZURE_ENV
    ProductOwner = var.PO
    Departement  = var.AZURE_DEP
  }
}
