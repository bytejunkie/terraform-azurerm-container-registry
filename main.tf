resource "azurerm_container_registry" "acr" {
  name                = join("", var.name_strings)
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  admin_enabled       = false
  #   georeplication_locations = ["East US", "West Europe"]

  tags = merge({
    Module-Name = "AWS VPC"
    Author      = "bytejunkie - matt@bytejunkie.dev"
    },
    var.tags
  )

}
