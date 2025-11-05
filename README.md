## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.38.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/resources/container_registry) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_admin_enabled"></a> [acr\_admin\_enabled](#input\_acr\_admin\_enabled) | Specifies whether the admin user is enabled for the Container Registry. | `bool` | `false` | no |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | The name of the Container Registry. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_acr_tier"></a> [acr\_tier](#input\_acr\_tier) | The SKU name of the Container Registry. Possible values are Basic, Standard, and Premium. | `string` | `"Basic"` | no |
| <a name="input_anonymous_pull_enabled"></a> [anonymous\_pull\_enabled](#input\_anonymous\_pull\_enabled) | Whether anonymous pull access is enabled for the Container Registry (Premium SKU only). | `bool` | `false` | no |
| <a name="input_data_endpoint_enabled"></a> [data\_endpoint\_enabled](#input\_data\_endpoint\_enabled) | Whether data endpoint is enabled for the Container Registry (Premium SKU only). | `bool` | `false` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of default tags to assign to all resources. | `map(string)` | n/a | yes |
| <a name="input_encryption"></a> [encryption](#input\_encryption) | Encryption configuration for the Container Registry (Premium SKU only). | <pre>object({<br/>    key_vault_key_id   = string<br/>    identity_client_id = string<br/>  })</pre> | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment to deploy resources into, such as 'dev', 'test', or 'prod'. | `string` | n/a | yes |
| <a name="input_export_policy_enabled"></a> [export\_policy\_enabled](#input\_export\_policy\_enabled) | Whether export policy is enabled for the Container Registry. | `bool` | `true` | no |
| <a name="input_georeplications"></a> [georeplications](#input\_georeplications) | A list of georeplication configurations for the Container Registry (Premium SKU only). | <pre>list(object({<br/>    location                  = string<br/>    zone_redundancy_enabled   = bool<br/>    regional_endpoint_enabled = bool<br/>    tags                      = map(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | Identity configuration for the Container Registry. | <pre>object({<br/>    type         = string<br/>    identity_ids = list(string)<br/>  })</pre> | `null` | no |
| <a name="input_network_rule_bypass_option"></a> [network\_rule\_bypass\_option](#input\_network\_rule\_bypass\_option) | Specifies whether Azure Services can bypass network rules. Possible values are 'AzureServices' or 'None'. | `string` | `"AzureServices"` | no |
| <a name="input_network_rule_set"></a> [network\_rule\_set](#input\_network\_rule\_set) | Network rules for the Container Registry (Premium SKU only). | <pre>object({<br/>    default_action = string<br/>    ip_rules       = list(string)<br/>  })</pre> | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for the Container Registry. | `bool` | `true` | no |
| <a name="input_quarantine_policy_enabled"></a> [quarantine\_policy\_enabled](#input\_quarantine\_policy\_enabled) | Whether quarantine policy is enabled for the Container Registry. | `bool` | `false` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The Azure region where the resource group is located. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the Container Registry will be created. | `string` | n/a | yes |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Number of days to retain untagged manifests in the Container Registry (Premium SKU only). Set to null to disable. | `number` | `null` | no |
| <a name="input_trust_policy"></a> [trust\_policy](#input\_trust\_policy) | Trust policy for the Container Registry (Premium SKU only). | <pre>object({<br/>    enabled = bool<br/>  })</pre> | `null` | no |
| <a name="input_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#input\_zone\_redundancy\_enabled) | Whether zone redundancy is enabled for the Container Registry (Premium SKU only). | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The Password associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The Username associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_data_endpoint_host_names"></a> [data\_endpoint\_host\_names](#output\_data\_endpoint\_host\_names) | A set of data endpoint hostnames associated with the Container Registry - if data endpoints are enabled. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Container Registry. |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity details of the Container Registry, including principal\_id and tenant\_id, if a managed identity is configured. |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The URL that can be used to log into the Container Registry. |
