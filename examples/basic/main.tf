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

module "acr_basic" {
  source                  = "../../"
  acr_name                = "mybasicacr"
  resource_group_name     = "rg-example"
  resource_group_location = "East US"
  acr_tier                = "Basic"
  acr_admin_enabled       = true

  default_tags = {
    environment = "dev"
    project     = "example"
  }
}
