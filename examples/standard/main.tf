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

module "acr_standard" {
  source                  = "../../"
  acr_name                = "mystandardacr"
  resource_group_name     = "rg-standard"
  resource_group_location = "East US"
  acr_tier                = "Standard"
  acr_admin_enabled       = false

  anonymous_pull_enabled = true

  network_rule_set = {
    default_action = "Deny"
    ip_rule = [
      { ip_range = "203.0.113.0/24" }
    ]
  }

  default_tags = {
    environment = "staging"
    project     = "example"
  }
}
