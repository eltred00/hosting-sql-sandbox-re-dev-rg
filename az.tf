provider "azurerm" {

 version = "~> 1.30.0"

 alias   = "primary"

}

provider "azurerm" {

 version         = "~> 1.30.0"

 subscription_id = "1373e92a-8aeb-419e-93d5-c420de1c51cd"

 alias           = "dev"

}

provider "azuread" {

 version = "~> 0.3.1"

}

 

provider "null" {

 version = "~> 2.1"

}

 

data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}


terraform {

 #required_version = "~> 0.12"

 

 backend "azurerm" {

   storage_account_name = "stcdevterraform"

   container_name       = "hosting-sql-sandbox-re-dev"

   key                  = "terraform.tfstate"

   resource_group_name  = "cloudautomation-dev-rg"

 }

}

 

variable "tags" {

 default = {

   "environment" = "dev"

 }

}
set PATH=%PATH%;C:\terraform_1.0.7_windows_amd64"

$env:Path += ";C:\terraform_1.0.7_windows_amd64"