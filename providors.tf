terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform_backend_state"
    storage_account_name = "terraformbackendstate"
    container_name       = "state"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}