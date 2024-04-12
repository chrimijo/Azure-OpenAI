## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.4.7)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.97.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (3.97.1)

## Modules

The following Modules are called:

### <a name="module_deploy-openai-model-2-apim"></a> [deploy-openai-model-2-apim](#module\_deploy-openai-model-2-apim)

Source: ./modules/deploy-openaimodel-and-api

Version:

## Resources

The following resources are used by this module:

- [azurerm_api_management.apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) (resource)
- [azurerm_api_management_api.api-model](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) (resource)
- [azurerm_api_management_api_policy.api_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) (resource)
- [azurerm_cognitive_account.cognitive](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) (resource)
- [azurerm_log_analytics_workspace.log](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) (resource)
- [azurerm_monitor_private_link_scope.ampls](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scope) (resource)
- [azurerm_network_security_group.nsg-apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.nsg-endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) (resource)
- [azurerm_private_dns_zone.dnszone-monitor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) (resource)
- [azurerm_private_dns_zone.dnszone-openai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) (resource)
- [azurerm_private_dns_zone_virtual_network_link.pl](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) (resource)
- [azurerm_private_endpoint.pep](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) (resource)
- [azurerm_private_endpoint.pepyes](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) (resource)
- [azurerm_public_ip.pip-public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) (resource)
- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)
- [azurerm_role_assignment.role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_subnet.sub-apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) (resource)
- [azurerm_subnet.sub-endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) (resource)
- [azurerm_subnet_network_security_group_association.nsg-asso-apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) (resource)
- [azurerm_subnet_network_security_group_association.nsg-asso-openai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) (resource)
- [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) (resource)
- [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_API_DEF_FILE_NAME"></a> [API\_DEF\_FILE\_NAME](#input\_API\_DEF\_FILE\_NAME)

Description: Variable to define the API definition file name

Type: `string`

### <a name="input_PO"></a> [PO](#input\_PO)

Description: Define who is the Product Owner

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_AZURE_AMPLS_PREFIX"></a> [AZURE\_AMPLS\_PREFIX](#input\_AZURE\_AMPLS\_PREFIX)

Description: Prefix for Azure Monitor Private Link Scope object

Type: `string`

Default: `"ampls"`

### <a name="input_AZURE_APIM_PREFIX"></a> [AZURE\_APIM\_PREFIX](#input\_AZURE\_APIM\_PREFIX)

Description: Prefix for Azure API Management instance

Type: `string`

Default: `"apim"`

### <a name="input_AZURE_API_PREFIX"></a> [AZURE\_API\_PREFIX](#input\_AZURE\_API\_PREFIX)

Description: Prefix for API into Azure API instance

Type: `string`

Default: `"api"`

### <a name="input_AZURE_APP_NAME"></a> [AZURE\_APP\_NAME](#input\_AZURE\_APP\_NAME)

Description: Prefix for application name and must be less or equal to 6 caracters

Type: `string`

Default: `"openai"`

### <a name="input_AZURE_CA_PREFIX"></a> [AZURE\_CA\_PREFIX](#input\_AZURE\_CA\_PREFIX)

Description: Prefix for Cognitive Account object

Type: `string`

Default: `"ca"`

### <a name="input_AZURE_CD_PREFIX"></a> [AZURE\_CD\_PREFIX](#input\_AZURE\_CD\_PREFIX)

Description: Prefix for Cognitive Deployment

Type: `string`

Default: `"cd"`

### <a name="input_AZURE_DEP"></a> [AZURE\_DEP](#input\_AZURE\_DEP)

Description: Prefix for department Owner of the OpenAI service

Type: `string`

Default: `"dep"`

### <a name="input_AZURE_ENV"></a> [AZURE\_ENV](#input\_AZURE\_ENV)

Description: Prefix use to define the environment: Developpement (dev), Recette (rec) or Production (prod)

Type: `string`

Default: `"dev"`

### <a name="input_AZURE_LOG_PREFIX"></a> [AZURE\_LOG\_PREFIX](#input\_AZURE\_LOG\_PREFIX)

Description: Prefix for Log Analytics Workspace object

Type: `string`

Default: `"vnet"`

### <a name="input_AZURE_NIC_PREFIX"></a> [AZURE\_NIC\_PREFIX](#input\_AZURE\_NIC\_PREFIX)

Description: Prefix for Network Interface Connection object

Type: `string`

Default: `"nic"`

### <a name="input_AZURE_NSG_PREFIX"></a> [AZURE\_NSG\_PREFIX](#input\_AZURE\_NSG\_PREFIX)

Description: Prefix for Network Security Group object

Type: `string`

Default: `"nsg"`

### <a name="input_AZURE_PEP_PREFIX"></a> [AZURE\_PEP\_PREFIX](#input\_AZURE\_PEP\_PREFIX)

Description: Prefix for Private EndPoint object

Type: `string`

Default: `"pep"`

### <a name="input_AZURE_PIP_PREFIX"></a> [AZURE\_PIP\_PREFIX](#input\_AZURE\_PIP\_PREFIX)

Description: Prefix for Public IP

Type: `string`

Default: `"pip"`

### <a name="input_AZURE_PL_PREFIX"></a> [AZURE\_PL\_PREFIX](#input\_AZURE\_PL\_PREFIX)

Description: Prefix for Private Link object

Type: `string`

Default: `"pl"`

### <a name="input_AZURE_PSC_PREFIX"></a> [AZURE\_PSC\_PREFIX](#input\_AZURE\_PSC\_PREFIX)

Description: Prefix for Private Service Connection object

Type: `string`

Default: `"psc"`

### <a name="input_AZURE_REGION"></a> [AZURE\_REGION](#input\_AZURE\_REGION)

Description: Choose the target Azure Region francecentral, westeurope, northeurope and southfrance

Type: `string`

Default: `"francecentral"`

### <a name="input_AZURE_REGION_TRIG"></a> [AZURE\_REGION\_TRIG](#input\_AZURE\_REGION\_TRIG)

Description: Trigram used in the ressource name for the target Azure Region, and based on the Azure Region choosed in variable AZURE\_REGION

Type: `map(string)`

Default:

```json
{
  "francecentral": "frct",
  "northeurop": "neu",
  "southfrance": "sfr",
  "westeurope": "weu"
}
```

### <a name="input_AZURE_RG_PREFIX"></a> [AZURE\_RG\_PREFIX](#input\_AZURE\_RG\_PREFIX)

Description: Prefix for Ressource Group object

Type: `string`

Default: `"rg"`

### <a name="input_AZURE_SNET_PREFIX"></a> [AZURE\_SNET\_PREFIX](#input\_AZURE\_SNET\_PREFIX)

Description: Prefix for SubNet object

Type: `string`

Default: `"snet"`

### <a name="input_AZURE_VNET_PREFIX"></a> [AZURE\_VNET\_PREFIX](#input\_AZURE\_VNET\_PREFIX)

Description: Prefix for Virtual Network object

Type: `string`

Default: `"vnet"`

### <a name="input_COMPANY"></a> [COMPANY](#input\_COMPANY)

Description: Company named used for the API Management deployement

Type: `string`

Default: `"COMPANY"`

### <a name="input_COMPANY-EMAIL"></a> [COMPANY-EMAIL](#input\_COMPANY-EMAIL)

Description: Email named used for the API Management deployement, this email is used for notifications

Type: `string`

Default: `"admin@company.com"`

### <a name="input_OpenAI-Model"></a> [OpenAI-Model](#input\_OpenAI-Model)

Description: Settings to add a API in APIM and build associate OpenAi model

Type: `map(any)`

Default:

```json
{
  "mod1": {
    "APP_CONSUMING": "botcmb",
    "GPTMODEL": "gpt-4",
    "GPTVERSION": "1106-Preview"
  },
  "mod2": {
    "APP_CONSUMING": "botcmb",
    "GPTMODEL": "gpt-35-turbo",
    "GPTVERSION": "0301"
  },
  "mod3": {
    "APP_CONSUMING": "botcmb",
    "GPTMODEL": "gpt-4",
    "GPTVERSION": "0613"
  },
  "mod4": {
    "APP_CONSUMING": "botcmso",
    "GPTMODEL": "gpt-4",
    "GPTVERSION": "1106-Preview"
  },
  "mod5": {
    "APP_CONSUMING": "botcmso",
    "GPTMODEL": "gpt-35-turbo",
    "GPTVERSION": "0301"
  },
  "mod6": {
    "APP_CONSUMING": "botcmso",
    "GPTMODEL": "gpt-4",
    "GPTVERSION": "0613"
  }
}
```

## Outputs

No outputs.
