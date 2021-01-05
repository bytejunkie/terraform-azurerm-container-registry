provider "azurerm" {
  features {}
}

#################
# pre-requisites
#################

module "resourcegroup" {
  source = "bytejunkie/resource-group/azurerm"

  name_strings   = ["byt", "rsg", "acr"]
  name_separator = "-"

  #   tags = var.tags
}

#################
# this module
#################

module "container_registry" {
  source = "../../"

  name_strings        = ["byt", "con", "reg", "001"]
  resource_group_name = module.resourcegroup.resource_group_name
  location            = "west europe"
  sku                 = "Standard"

  depends_on = [
    module.resourcegroup
  ]

  tags = {
    location = "west europe"
  }
}
