resource "azurerm_container_app" "app" {
    container_app_environment_id = azurerm_container_app_environment.nu-masternet-dev-mxn-acae.id
    name = "nu-masternet-dev-cmx-aca"
    resource_group_name = azurerm_resource_group.my-nu-masternet.name
    revision_mode = "Multiple"

    template {
        min_replicas = 1
        max_replicas = 3

        container {
          name = "nu-masternet-dev-cmx-app"
          cpu= 0.5
          memory = "1Gi"
          image = "mcr.microsoft.com/k8se/quickstart:latest"
        }
    }

    ingress {
      allow_insecure_connections = false
      external_enabled = true
      target_port = 8080

      traffic_weight {
       percentage = 100
       label = "primary"
       latest_revision = true  
      }
    }

    tags = {
      environment = var.env_id
      src = var.src_key
    }
  
}