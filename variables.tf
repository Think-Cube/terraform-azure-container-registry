variable "acr_name" {
  description = "The name of the Container Registry. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Container Registry will be created."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region in which to create the Container Registry. Changing this forces a new resource to be created."
  type        = string
}

variable "acr_tier" {
  description = "The SKU name of the Container Registry. Possible values are Basic, Standard, and Premium."
  type        = string
  default     = "Basic"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.acr_tier)
    error_message = "The SKU must be one of: Basic, Standard, Premium."
  }
}

variable "acr_admin_enabled" {
  description = "Specifies whether the admin user is enabled for the Container Registry."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for the Container Registry."
  type        = bool
  default     = true
}

variable "quarantine_policy_enabled" {
  description = "Whether quarantine policy is enabled for the Container Registry."
  type        = bool
  default     = false
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled for the Container Registry (Premium SKU only)."
  type        = bool
  default     = false
}

variable "export_policy_enabled" {
  description = "Whether export policy is enabled for the Container Registry. Requires public_network_access_enabled = true."
  type        = bool
  default     = true
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pull access is enabled for the Container Registry (Standard and Premium SKU only)."
  type        = bool
  default     = false
}

variable "data_endpoint_enabled" {
  description = "Whether dedicated data endpoints are enabled for the Container Registry (Premium SKU only)."
  type        = bool
  default     = false
}

variable "network_rule_bypass_option" {
  description = "Specifies whether to allow trusted Azure services to access a network-restricted Container Registry. Possible values are 'AzureServices' or 'None'."
  type        = string
  default     = "AzureServices"
  validation {
    condition     = contains(["AzureServices", "None"], var.network_rule_bypass_option)
    error_message = "The network_rule_bypass_option must be one of: AzureServices, None."
  }
}

variable "retention_policy_in_days" {
  description = "The number of days to retain untagged manifests before they are purged (Premium SKU only). Set to null to disable."
  type        = number
  default     = null
}

variable "trust_policy_enabled" {
  description = "Whether content trust (image signing) is enabled for the Container Registry (Premium SKU only)."
  type        = bool
  default     = false
}

variable "georeplications" {
  description = "A list of georeplication configurations for the Container Registry (Premium SKU only)."
  type = list(object({
    location                  = string
    zone_redundancy_enabled   = optional(bool, false)
    regional_endpoint_enabled = optional(bool, false)
    tags                      = optional(map(string), {})
  }))
  default = []
}

variable "network_rule_set" {
  description = "Network rule set for the Container Registry (Premium SKU only). Set to null to disable."
  type = object({
    default_action = optional(string, "Deny")
    ip_rule = optional(list(object({
      action   = optional(string, "Allow")
      ip_range = string
    })), [])
  })
  default = null

  validation {
    condition     = var.network_rule_set == null ? true : contains(["Allow", "Deny"], var.network_rule_set.default_action)
    error_message = "network_rule_set.default_action must be one of: Allow, Deny."
  }
}

variable "identity" {
  description = "Managed identity configuration. type can be 'SystemAssigned', 'UserAssigned', or 'SystemAssigned, UserAssigned'. identity_ids is required for UserAssigned."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "encryption" {
  description = "Customer-managed key encryption configuration for the Container Registry (Premium SKU only). Set to null to use Microsoft-managed keys."
  type = object({
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = null
}

variable "timeouts" {
  description = "Custom timeouts for create, read, update and delete operations."
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "default_tags" {
  description = "A map of default tags to assign to the Container Registry."
  type        = map(string)
  default     = {}
}
