terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.45.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
    name = "${var.project_name}-${var.env}-rg"
    location = var.location
}