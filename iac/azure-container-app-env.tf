resource "azurerm_container_app_environment" "nu-masternet-dev-mxn-acae" {
  location = "East US"
  name = "nu-masternet-dev-mxn-acae"
  resource_group_name = azurerm_resource_group.my-nu-masternet.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.my-nu-masternet-cmx-law.id

  tags ={
    environment = var.env_id
    src = var.src_key
  }
}