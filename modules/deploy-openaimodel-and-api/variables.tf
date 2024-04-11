
/*
Module: Variable Definitions for Azure API Management and OpenAI Configuration.
This module defines the variables used in the Terraform configuration for setting up Azure API Management and OpenAI.
It includes variables for the API Management name, the Azure API Management prefix, the OpenAI URL,
and the API definition file name, with validation rules for these variables.
*/

variable "AZURE_CD_PREFIX" {
  type = string
  validation {
    condition     = length(var.AZURE_CD_PREFIX) > 0
    error_message = "Cannot be empty"
  }
}

variable "SUFFIX" {
  type = string
  validation {
    condition     = length(var.SUFFIX) > 0
    error_message = "Cannot be empty"
  }
}

variable "COGNITIVEACID" {
  type = string
  validation {
    condition     = length(var.COGNITIVEACID) > 0
    error_message = "Cannot be empty"
  }
}


variable "GPTMODEL" {
  type = string
  validation {
    condition     = length(var.GPTMODEL) > 0
    error_message = "Cannot be empty"
  }
}

variable "GPTVERSION" {
  type = string
  validation {
    condition     = length(var.GPTVERSION) > 0
    error_message = "Cannot be empty"
  }
}

variable "AZURE_API_PREFIX" {
  type = string
  validation {
    condition     = length(var.AZURE_API_PREFIX) > 0
    error_message = "Cannot be empty"
  }
}

variable "RGNAME" {
  type = string
  validation {
    condition     = length(var.RGNAME) > 0
    error_message = "Cannot be empty"
  }
}

variable "APIMNGNAME" {
  type = string
  validation {
    condition     = length(var.APIMNGNAME) > 0
    error_message = "Cannot be empty"
  }
}

variable "APINAME" {
  type = string
  validation {
    condition     = length(var.APINAME) > 0
    error_message = "Cannot be empty"
  }
}

variable "AZURE_APIM_PREFIX" {
  type = string
  validation {
    condition     = length(var.AZURE_APIM_PREFIX) > 0
    error_message = "Cannot be empty"
  }
}

variable "OPENAI_URL" {
  type = string
  validation {
    condition     = length(var.OPENAI_URL) > 0
    error_message = "Cannot be empty"
  }
}

variable "APP_CONSUMING" {
  type = string
  validation {
    condition     = length(var.APP_CONSUMING) > 0
    error_message = "Cannot be empty"
  }
}