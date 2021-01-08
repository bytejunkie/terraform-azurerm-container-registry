provider "azurerm" {
  features {}
}

#################
# pre-requisites
#################

module "resourcegroup" {
  source = "bytejunkie/resource-group/azurerm"

  name_strings   = ["byt", "rsg", "acr2"]
  name_separator = "-"

  #   tags = var.tags
}

#################
# this module
#################

module "container_registry" {
  source = "../../"

  name_strings        = ["byt", "con", "reg", "002"]
  resource_group_name = module.resourcegroup.resource_group_name
  location            = "west europe"
  sku                 = "Standard"
  admin_enabled       = "true"

  depends_on = [
    module.resourcegroup
  ]

  tags = {
    location = "west europe"
  }
}
