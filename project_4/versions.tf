# Azure has three difference providers (Azure RM, Azure stack and Azure AD) in Terraform

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }
  }
}

provider "azuread" {
  # Configuration options
}

