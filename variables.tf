variable "name" {
  description = "The name of the Container Registry. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Container Registry will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the Container Registry will be created."
  type        = string
}

variable "sku" {
  description = "The SKU name of the Container Registry. Possible values are 'Basic', 'Standard', and 'Premium'."
  type        = string
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "The sku must be one of: Basic, Standard, Premium."
  }
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled for the Container Registry. Defaults to false."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for the Container Registry. Defaults to true."
  type        = bool
  default     = true
}

variable "quarantine_policy_enabled" {
  description = "Whether quarantine policy is enabled for the Container Registry."
  type        = bool
  default     = null
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled for the Container Registry. Premium SKU only."
  type        = bool
  default     = false
}

variable "export_policy_enabled" {
  description = "Whether export policy is enabled for the Container Registry."
  type        = bool
  default     = null
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pull access is enabled for the Container Registry. Standard or Premium SKU only."
  type        = bool
  default     = null
}

variable "data_endpoint_enabled" {
  description = "Whether data endpoint is enabled for the Container Registry. Premium SKU only."
  type        = bool
  default     = null
}

variable "network_rule_bypass_option" {
  description = "Whether Azure Services can bypass network rules for the Container Registry. Possible values are 'AzureServices' or 'None'."
  type        = string
  default     = null
  validation {
    condition     = var.network_rule_bypass_option == null || contains(["AzureServices", "None"], var.network_rule_bypass_option)
    error_message = "The network_rule_bypass_option must be one of: AzureServices, None."
  }
}

variable "retention_policy_in_days" {
  description = "Number of days to retain untagged manifests in the Container Registry. Premium SKU only."
  type        = number
  default     = null
}

variable "trust_policy_enabled" {
  description = "Whether the trust policy is enabled for the Container Registry. Premium SKU only."
  type        = bool
  default     = null
}

variable "identity" {
  description = "Identity configuration block for the Container Registry."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "encryption" {
  description = "Encryption configuration block for the Container Registry. Premium SKU only."
  type = object({
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = null
}

variable "georeplications" {
  description = "A list of georeplication configurations for the Container Registry. Premium SKU only."
  type = list(object({
    location                  = string
    zone_redundancy_enabled   = optional(bool, false)
    regional_endpoint_enabled = optional(bool, false)
    tags                      = optional(map(string), {})
  }))
  default = []
}

variable "network_rule_set" {
  description = "Network rule set configuration for the Container Registry. Premium SKU only."
  type = object({
    default_action  = optional(string, "Allow")
    ip_rules        = optional(list(string), [])
    virtual_networks = optional(list(string), [])
  })
  default = null
}

variable "tags" {
  description = "Tags to assign to resources."
  type        = map(string)
  default     = {}
}
