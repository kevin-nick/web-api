resource "azurerm_resource_group" "my-nu-masternet" {
  location = var.location
  name = "nu-masternet-dev-cmx-rg"

  tags = {
    environment = var.env_id
    src = var.src_key
  }
}