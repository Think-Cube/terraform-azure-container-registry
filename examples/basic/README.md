# Example: Basic

Minimal working example for `terraform-azure-container-registry`.

```hcl
module "container_registry" {
  source = "github.com/Think-Cube/terraform-azure-container-registry?ref=v1.0.0"

  name                = "acrdevexample"
  resource_group_name = "rg-example"
  location            = "West Europe"
  sku                 = "Standard"

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}```` 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | github.com/Think-Cube/terraform-azure-container-registry | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->