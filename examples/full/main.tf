terraform {
  required_version = ">= 1.6.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "acr_full_premium" {
  source                  = "../../"
  acr_name                = "myfullpremiumacr"
  resource_group_name     = "rg-full"
  resource_group_location = "West Europe"
  acr_tier                = "Premium"
  acr_admin_enabled       = false

  public_network_access_enabled = false
  quarantine_policy_enabled     = true
  zone_redundancy_enabled       = true
  export_policy_enabled         = false
  anonymous_pull_enabled        = false
  data_endpoint_enabled         = true
  network_rule_bypass_option    = "AzureServices"
  retention_policy_in_days      = 90
  trust_policy_enabled          = true

  georeplications = [
    {
      location                  = "North Europe"
      zone_redundancy_enabled   = true
      regional_endpoint_enabled = true
      tags = {
        replication = "north"
      }
    }
  ]

  network_rule_set = {
    default_action = "Deny"
    ip_rule = [
      { action = "Allow", ip_range = "203.0.113.0/24" }
    ]
  }

  identity = {
    type         = "UserAssigned"
    identity_ids = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-full/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-acr-full"]
  }

  encryption = {
    key_vault_key_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-full/providers/Microsoft.KeyVault/vaults/myvault/keys/mykey"
    identity_client_id = "00000000-0000-0000-0000-000000000000"
  }

  timeouts = {
    create = "30m"
    delete = "30m"
  }

  default_tags = {
    environment = "prod"
    project     = "example"
  }
}
