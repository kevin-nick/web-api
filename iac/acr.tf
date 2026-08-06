resource "azurerm_container_registry" "acr" {
    location = azurerm_resource_group.my-nu-masternet.location
    name = "numasternet${var.env_id}mxacr"
    resource_group_name = azurerm_resource_group.my-nu-masternet.name
    sku = "Standard"
    admin_enabled = true
    public_network_access_enabled = true

    tags = {
      environment = var.env_id
      src_key = var.src_key
    }
}