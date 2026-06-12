resource "azurerm_container_registry" "main" {
  name                          = var.acr_name
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  sku                           = var.acr_tier
  admin_enabled                 = var.acr_admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  quarantine_policy_enabled     = var.quarantine_policy_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled
  export_policy_enabled         = var.export_policy_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  network_rule_bypass_option    = var.network_rule_bypass_option
  retention_policy_in_days      = var.retention_policy_in_days
  trust_policy_enabled          = var.trust_policy_enabled
  tags                          = var.default_tags

  dynamic "georeplications" {
    for_each = var.georeplications
    content {
      location                  = georeplications.value.location
      zone_redundancy_enabled   = georeplications.value.zone_redundancy_enabled
      regional_endpoint_enabled = georeplications.value.regional_endpoint_enabled
      tags                      = merge(var.default_tags, georeplications.value.tags)
    }
  }

  dynamic "network_rule_set" {
    for_each = var.network_rule_set != null ? [var.network_rule_set] : []
    content {
      default_action = network_rule_set.value.default_action

      dynamic "ip_rule" {
        for_each = network_rule_set.value.ip_rule
        content {
          action   = ip_rule.value.action
          ip_range = ip_rule.value.ip_range
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "encryption" {
    for_each = var.encryption != null ? [var.encryption] : []
    content {
      key_vault_key_id   = encryption.value.key_vault_key_id
      identity_client_id = encryption.value.identity_client_id
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
