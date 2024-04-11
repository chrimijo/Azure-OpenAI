## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.7.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.90.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.90.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management_api.api-model](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api_policy.api_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_product.openai-product](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product) | resource |
| [azurerm_api_management_product_api.openai-product-api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api) | resource |
| [azurerm_api_management_subscription.openai-subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_subscription) | resource |
| [azurerm_cognitive_deployment.model](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_APIMNGNAME"></a> [APIMNGNAME](#input\_APIMNGNAME) | n/a | `string` | n/a | yes |
| <a name="input_API_DEF_FILE_NAME"></a> [API\_DEF\_FILE\_NAME](#input\_API\_DEF\_FILE\_NAME) | n/a | `string` | n/a | yes |
| <a name="input_AZURE_APIM_PREFIX"></a> [AZURE\_APIM\_PREFIX](#input\_AZURE\_APIM\_PREFIX) | n/a | `string` | n/a | yes |
| <a name="input_AZURE_API_PREFIX"></a> [AZURE\_API\_PREFIX](#input\_AZURE\_API\_PREFIX) | n/a | `string` | n/a | yes |
| <a name="input_AZURE_CD_PREFIX"></a> [AZURE\_CD\_PREFIX](#input\_AZURE\_CD\_PREFIX) | n/a | `string` | n/a | yes |
| <a name="input_COGNITIVEACID"></a> [COGNITIVEACID](#input\_COGNITIVEACID) | n/a | `string` | n/a | yes |
| <a name="input_GPTMODEL"></a> [GPTMODEL](#input\_GPTMODEL) | n/a | `string` | n/a | yes |
| <a name="input_GPTVERSION"></a> [GPTVERSION](#input\_GPTVERSION) | n/a | `string` | n/a | yes |
| <a name="input_OPENAI_URL"></a> [OPENAI\_URL](#input\_OPENAI\_URL) | n/a | `string` | n/a | yes |
| <a name="input_RGNAME"></a> [RGNAME](#input\_RGNAME) | n/a | `string` | n/a | yes |
| <a name="input_SUFFIX"></a> [SUFFIX](#input\_SUFFIX) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
