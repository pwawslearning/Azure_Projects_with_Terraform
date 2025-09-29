terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.41.0"
    }
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.sub_id
  features {

  }
}