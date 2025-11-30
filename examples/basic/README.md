# Terraform Azure Container Registry - Basic Example

This example demonstrates a **basic deployment** of an Azure Container Registry (ACR) using the module.

It is suitable for **development or test environments** where:

- Minimal configuration is needed
- No georeplication is required
- Public network access is enabled
- No managed identity or encryption is required


```hcl
module "acr_basic" {
  source                  = "./terraform-azure-container-registry"
  acr_name                = "mybasicacr"
  resource_group_name     = "rg-example"
  resource_group_location = "East US"
  acr_tier                = "Basic"
  acr_admin_enabled       = true
  public_network_access_enabled = true
  quarantine_policy_enabled     = false
  zone_redundancy_enabled       = false
  export_policy_enabled         = false
  anonymous_pull_enabled        = false
  data_endpoint_enabled         = false
  network_rule_bypass_option    = "AzureServices"
  retention_policy               = 7
  trust_policy                    = { enabled = false }

  georeplications = []

  network_rule_set = null
  identity         = null
  encryption       = null

  default_tags = {
    environment = "dev"
    project     = "example"
  }
}
```
