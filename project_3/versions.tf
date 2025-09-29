terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.19.0"
    }
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
  # Configuration options
  subscription_id = ""
  features {
  }
}
terraform {
  backend "azurerm" {
    resource_group_name  = "storage-rg-01"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "storagewithterraform01" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "test.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}