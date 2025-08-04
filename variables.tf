variable "acr_name" {
  description = "The name of the Container Registry. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Container Registry will be created."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region where the resource group is located."
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
  description = "Whether export policy is enabled for the Container Registry."
  type        = bool
  default     = true
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pull access is enabled for the Container Registry (Premium SKU only)."
  type        = bool
  default     = false
}

variable "data_endpoint_enabled" {
  description = "Whether data endpoint is enabled for the Container Registry (Premium SKU only)."
  type        = bool
  default     = false
}

variable "network_rule_bypass_option" {
  description = "Specifies whether Azure Services can bypass network rules. Possible values are 'AzureServices' or 'None'."
  type        = string
  default     = "AzureServices"
  validation {
    condition     = contains(["AzureServices", "None"], var.network_rule_bypass_option)
    error_message = "The network_rule_bypass_option must be one of: AzureServices, None."
  }
}

variable "georeplications" {
  description = "A list of georeplication configurations for the Container Registry (Premium SKU only)."
  type = list(object({
    location                  = string
    zone_redundancy_enabled   = bool
    regional_endpoint_enabled = bool
    tags                      = map(string)
  }))
  default = []
}

variable "network_rule_set" {
  description = "Network rules for the Container Registry (Premium SKU only)."
  type = object({
    default_action = string
    ip_rules       = list(string)
  })
  default = null
}

variable "retention_policy" {
  description = "Number of days to retain untagged manifests in the Container Registry (Premium SKU only). Set to null to disable."
  type = number
  default = null
}

variable "trust_policy" {
  description = "Trust policy for the Container Registry (Premium SKU only)."
  type = object({
    enabled = bool
  })
  default = null
}

variable "identity" {
  description = "Identity configuration for the Container Registry."
  type = object({
    type         = string
    identity_ids = list(string)
  })
  default = null
}

variable "encryption" {
  description = "Encryption configuration for the Container Registry (Premium SKU only)."
  type = object({
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = null
}

variable "default_tags" {
  description = "A map of default tags to assign to all resources."
  type        = map(string)
}

variable "environment" {
  description = "The name of the environment to deploy resources into, such as 'dev', 'test', or 'prod'."
  type        = string
}