resource "azurerm_log_analytics_workspace" "my-nu-masternet-cmx-law" {
  location = azurerm_resource_group.my-nu-masternet.location
  name = "nu-masternet-${var.env_id}-cmx-law"
  resource_group_name = azurerm_resource_group.my-nu-masternet.name
  sku = "PerGB2018"
  retention_in_days = 30
}