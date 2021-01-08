resource "azurerm_container_registry" "acr" {
  name                     = join("", var.name_strings)
  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  georeplication_locations = var.georeplication_locations != "" ? var.georeplication_locations : null

  tags = merge({
    Module-Name = "Azure Container Registry"
    Author      = "bytejunkie - matt@bytejunkie.dev"
    },
    var.tags
  )

}
