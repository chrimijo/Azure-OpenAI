/*
Module: Azure and OpenAI Configuration Variable Assignments
This module assigns values to the variables used in the Terraform configuration for setting up Azure and OpenAI.
It includes variables for the Azure region, environment, application name, deployment, company details, and various Azure resource prefixes.
*/


AZURE_REGION   = "francecentral"
AZURE_ENV      = "rec"
AZURE_APP_NAME = "openai"
AZURE_DEP      = "iac"
COMPANY        = "INNOVAMIS"
PO             = "Christian JOSEPH"
COMPANY-EMAIL  = "christian.joseph@innovamis.com"

# nomenclature definition
AZURE_RG_PREFIX    = "rg"    # Ressource Group
AZURE_NSG_PREFIX   = "nsg"   # Network Security Group 
AZURE_VNET_PREFIX  = "vnet"  # Vitual Network
AZURE_LOG_PREFIX   = "log"   # Log Analytics Workspace
AZURE_PIP_PREFIX   = "pip"   # Pulic IP address
AZURE_PEP_PREFIX   = "pep"   # Private Endpoint
AZURE_SNET_PREFIX  = "snet"  # Subnet
AZURE_AMPLS_PREFIX = "ampls" # Azure Monitor Private Link Scope
AZURE_PSC_PREFIX   = "psc"   # Private Service Connexion
AZURE_NIC_PREFIX   = "nic"   # Network Interface 
AZURE_CA_PREFIX    = "ca"    # cognitive Account 
AZURE_CD_PREFIX    = "cd"    # cognitive Deployement 
AZURE_PL_PREFIX    = "pl"    # Private Link
AZURE_APIM_PREFIX  = "apim"  # API Management
AZURE_API_PREFIX   = "api"   # API au sein d'API Management
API_DEF_FILE_NAME  = "AzureOpenAI-2024-03-01-preview.json"