module "container_registry" {
  source = "github.com/Think-Cube/terraform-azure-container-registry?ref=v1.0.0"

  name                          = "acrprodexample"
  resource_group_name           = "rg-example"
  location                      = "West Europe"
  sku                           = "Premium"
  admin_enabled                 = false
  public_network_access_enabled = false
  zone_redundancy_enabled       = true
  data_endpoint_enabled         = true
  retention_policy_in_days      = 30
  trust_policy_enabled          = true
  network_rule_bypass_option    = "AzureServices"

  identity = {
    type = "SystemAssigned"
  }

  georeplications = [
    {
      location                  = "North Europe"
      zone_redundancy_enabled   = true
      regional_endpoint_enabled = true
    }
  ]

  network_rule_set = {
    default_action = "Deny"
    ip_rules       = ["203.0.113.0/24"]
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}