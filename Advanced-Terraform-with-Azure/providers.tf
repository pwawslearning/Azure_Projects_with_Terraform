terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id = ""
  features {
    }
  }