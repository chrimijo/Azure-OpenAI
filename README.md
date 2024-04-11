## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.7.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.97.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.97.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_deploy-openai-model-2-apim"></a> [deploy-openai-model-2-apim](#module\_deploy-openai-model-2-apim) | ./modules/deploy-openaimodel-and-api | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management.apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |
| [azurerm_cognitive_account.cognitive](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) | resource |
| [azurerm_log_analytics_workspace.log](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_private_link_scope.ampls](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_private_link_scope) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nsg-apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nsg-endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_private_dns_zone.dnszone-monitor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.dnszone-openai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.pl](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.pep](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.pepyes](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_public_ip.pip-private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.pip-public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.pip-win11](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.sub-apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.sub-endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg-asso-apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.nsg-asso-openai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_cognitive_account.cognitive](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/cognitive_account) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AZURE_AMPLS_PREFIX"></a> [AZURE\_AMPLS\_PREFIX](#input\_AZURE\_AMPLS\_PREFIX) | Prefix for Azure Monitor Private Link Scope object | `string` | `"ampls"` | no |
| <a name="input_AZURE_APIM_PREFIX"></a> [AZURE\_APIM\_PREFIX](#input\_AZURE\_APIM\_PREFIX) | Prefix for Azure API Management instance | `string` | `"apim"` | no |
| <a name="input_AZURE_API_PREFIX"></a> [AZURE\_API\_PREFIX](#input\_AZURE\_API\_PREFIX) | Prefix for API into Azure API instance | `string` | `"api"` | no |
| <a name="input_AZURE_APP_NAME"></a> [AZURE\_APP\_NAME](#input\_AZURE\_APP\_NAME) | Prefix for application name and must be less or equal to 6 caracters | `string` | `"openai"` | no |
| <a name="input_AZURE_CA_PREFIX"></a> [AZURE\_CA\_PREFIX](#input\_AZURE\_CA\_PREFIX) | Prefix for Cognitive Account object | `string` | `"ca"` | no |
| <a name="input_AZURE_CD_PREFIX"></a> [AZURE\_CD\_PREFIX](#input\_AZURE\_CD\_PREFIX) | Prefix for Cognitive Deployment | `string` | `"cd"` | no |
| <a name="input_AZURE_DEP"></a> [AZURE\_DEP](#input\_AZURE\_DEP) | Prefix for department Owner of the OpenAI service | `string` | `"dep"` | no |
| <a name="input_AZURE_ENV"></a> [AZURE\_ENV](#input\_AZURE\_ENV) | Prefix use to define the environment: Developpement (dev), Recette (rec) or Production (prod) | `string` | `"dev"` | no |
| <a name="input_AZURE_LOG_PREFIX"></a> [AZURE\_LOG\_PREFIX](#input\_AZURE\_LOG\_PREFIX) | Prefix for Log Analytics Workspace object | `string` | `"vnet"` | no |
| <a name="input_AZURE_NIC_PREFIX"></a> [AZURE\_NIC\_PREFIX](#input\_AZURE\_NIC\_PREFIX) | Prefix for Network Interface Connection object | `string` | `"nic"` | no |
| <a name="input_AZURE_NSG_PREFIX"></a> [AZURE\_NSG\_PREFIX](#input\_AZURE\_NSG\_PREFIX) | Prefix for Network Security Group object | `string` | `"nsg"` | no |
| <a name="input_AZURE_PEP_PREFIX"></a> [AZURE\_PEP\_PREFIX](#input\_AZURE\_PEP\_PREFIX) | Prefix for Private EndPoint object | `string` | `"pep"` | no |
| <a name="input_AZURE_PIP_PREFIX"></a> [AZURE\_PIP\_PREFIX](#input\_AZURE\_PIP\_PREFIX) | Prefix for Public IP | `string` | `"pip"` | no |
| <a name="input_AZURE_PL_PREFIX"></a> [AZURE\_PL\_PREFIX](#input\_AZURE\_PL\_PREFIX) | Prefix for Private Link object | `string` | `"pl"` | no |
| <a name="input_AZURE_PSC_PREFIX"></a> [AZURE\_PSC\_PREFIX](#input\_AZURE\_PSC\_PREFIX) | Prefix for Private Service Connection object | `string` | `"psc"` | no |
| <a name="input_AZURE_REGION"></a> [AZURE\_REGION](#input\_AZURE\_REGION) | Choose the target Azure Region francecentral, westeurope, northeurope and southfrance | `string` | `"francecentral"` | no |
| <a name="input_AZURE_REGION_TRIG"></a> [AZURE\_REGION\_TRIG](#input\_AZURE\_REGION\_TRIG) | Trigram used in the ressource name for the target Azure Region, and based on the Azure Region choosed in variable AZURE\_REGION | `map(string)` | <pre>{<br>  "francecentral": "frct",<br>  "northeurop": "neu",<br>  "southfrance": "sfr",<br>  "westeurope": "weu"<br>}</pre> | no |
| <a name="input_AZURE_RG_PREFIX"></a> [AZURE\_RG\_PREFIX](#input\_AZURE\_RG\_PREFIX) | Prefix for Ressource Group object | `string` | `"rg"` | no |
| <a name="input_AZURE_SNET_PREFIX"></a> [AZURE\_SNET\_PREFIX](#input\_AZURE\_SNET\_PREFIX) | Prefix for SubNet object | `string` | `"snet"` | no |
| <a name="input_AZURE_VNET_PREFIX"></a> [AZURE\_VNET\_PREFIX](#input\_AZURE\_VNET\_PREFIX) | Prefix for Virtual Network object | `string` | `"vnet"` | no |
| <a name="input_COMPANY"></a> [COMPANY](#input\_COMPANY) | Company named used for the API Management deployement | `string` | `"COMPANY"` | no |
| <a name="input_COMPANY-EMAIL"></a> [COMPANY-EMAIL](#input\_COMPANY-EMAIL) | Email named used for the API Management deployement, this email is used for notifications | `string` | `"admin@company.com"` | no |
| <a name="input_OpenAI-Model"></a> [OpenAI-Model](#input\_OpenAI-Model) | Settings to add a API in APIM and build associate OpenAi model | `map(any)` | <pre>{<br>  "mod1": {<br>    "API_DEF_FILE_NAME": "AzureOpenAI-2024-03-01-preview.json",<br>    "GPTMODEL": "gpt-35-turbo",<br>    "GPTVERSION": "0301"<br>  }<br>}</pre> | no |
| <a name="input_PO"></a> [PO](#input\_PO) | Define who is the Product Owner | `string` | n/a | yes |

## Outputs

No outputs.
