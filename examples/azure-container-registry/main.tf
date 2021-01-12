provider "azurerm" {
  features {}
}

resource "random_pet" "acr" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
  }
  separator = ""

}
#################
# pre-requisites
#################

module "resourcegroup" {
  source = "bytejunkie/resource-group/azurerm"

  #location       = "west europe"
  name_strings   = ["byt", "rsg", random_pet.acr.id]
  name_separator = "-"

  #   tags = var.tags
}

#################
# this module
#################

module "container_registry" {
  source = "../../"

  name_strings        = ["byt", "acr", random_pet.acr.id]
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
