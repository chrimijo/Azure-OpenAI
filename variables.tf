# Prefix used as define by MS as an example in their Cloud Adoption Framework. https://learn.microsoft.com/fr-fr/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

variable "AZURE_REGION" {
  type        = string
  default     = "francecentral"
  description = "Choose the target Azure Region francecentral, westeurope, northeurope and southfrance"
  validation {
    condition     = contains(["francecentral", "westeurope", "northeurope", "southfrance"], var.AZURE_REGION)
    error_message = "The region must be either francecentral, westeurope, northeurope, southfrance"
  }
}

variable "AZURE_ENV" {
  type        = string
  default     = "dev"
  description = "Prefix use to define the environment: Developpement (dev), Recette (rec) or Production (prod)"
  validation {
    condition     = contains(["dev", "rec", "prod"], var.AZURE_ENV)
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
  description = "Build a string prefix, with departement name of the company, the environnement, the application name and the target region"
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
}

variable "AZURE_NSG_PREFIX" {
  type        = string
  default     = "nsg"
  description = "Prefix for Network Security Group object"
}

variable "AZURE_VNET_PREFIX" {
  type        = string
  default     = "vnet"
  description = "Prefix for Virtual Network object"
}

variable "AZURE_LOG_PREFIX" {
  type        = string
  default     = "vnet"
  description = "Prefix for Log Analytics Workspace object"
}

variable "AZURE_PIP_PREFIX" {
  type        = string
  default     = "pip"
  description = "Prefix for Public IP"
}

variable "AZURE_PEP_PREFIX" {
  type        = string
  default     = "pep"
  description = "Prefix for Private EndPoint object"
}

variable "AZURE_SNET_PREFIX" {
  type        = string
  default     = "snet"
  description = "Prefix for SubNet object"
}

variable "AZURE_AMPLS_PREFIX" {
  type        = string
  default     = "ampls"
  description = "Prefix for Azure Monitor Private Link Scope object"
}

variable "AZURE_PSC_PREFIX" {
  type        = string
  default     = "psc"
  description = "Prefix for Private Service Connexion object"
}

variable "AZURE_NIC_PREFIX" {
  type        = string
  default     = "nic"
  description = "Prefix for Network Interface Connexion object"
}

variable "AZURE_CA_PREFIX" {
  type        = string
  default     = "ca"
  description = "Prefix for Cognitive Accont object"
}

variable "AZURE_CD_PREFIX" {
  type        = string
  default     = "cd"
  description = "Prefix for Cognitive Deployment"
}

variable "AZURE_PL_PREFIX" {
  type        = string
  default     = "pl"
  description = "Prefix for Private Link object"
}

variable "AZURE_APIM_PREFIX" {
  type        = string
  default     = "apim"
  description = "Prefix for Azure API Management instance"
}

variable "AZURE_API_PREFIX" {
  type        = string
  default     = "api"
  description = "Prefix for API into Azure API Management instance"
}


# Tag variables
variable "AZURE_DEP" {
  type        = string
  default     = "dep"
  description = "Prefix for department Owner of the OpenAI service"
  validation {
    condition     = length(var.AZURE_DEP) > 0
    error_message = "The Deployment cannot be empty"
  }
}

### A TRANSFORMER EN POLICY ###
variable "default_tags" {
  type        = map(string)
  description = "Tag to be added to all Azure ressource"
  default = {
    Environment  = "Production"
    ProductOwner = "CJO"
    Departement  = "AEIS"
  }
}

variable "OpenAI-Model" {
  description = "Settings to add a API in APIM and build associate OpenAi model"

  type = map(any)
  default = {
    mod1 = {
      GPTMODEL          = "gpt-35-turbo"
      GPTVERSION        = "0301"
      API_DEF_FILE_NAME = "AzureOpenAI-2023-03-15-preview.json"
    },
    mod2 = {
      GPTMODEL          = "gpt-4"
      GPTVERSION        = "0613"
      API_DEF_FILE_NAME = "AzureOpenAI-2023-03-15-preview.json"
    }
  }
}