module "acr_standard" {
  source                  = "./terraform-azure-container-registry"
  acr_name                = "mystandardacr"
  resource_group_name     = "rg-standard"
  resource_group_location = "East US"
  acr_tier                = "Standard"
  acr_admin_enabled       = false
  public_network_access_enabled = true
  quarantine_policy_enabled     = false
  zone_redundancy_enabled       = false
  export_policy_enabled         = true
  anonymous_pull_enabled        = false
  data_endpoint_enabled         = false
  network_rule_bypass_option    = "AzureServices"
  retention_policy               = 14
  trust_policy                    = { enabled = false }

  georeplications = []

  network_rule_set = null
  identity         = null
  encryption       = null

  default_tags = {
    environment = "staging"
    project     = "example"
  }
}
