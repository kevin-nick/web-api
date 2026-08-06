resource "azurerm_mssql_server" "sql_server" {
    location = azurerm_resource_group.my-nu-masternet.location
    name = "nu-masternet-dev-cmx-sqlserver"
    resource_group_name = azurerm_resource_group.my-nu-masternet.name
    version = "12.0"

    administrator_login = "nuadmin"
    administrator_login_password = var.sql_pass

    tags = {
        environment = var.env_id
        src = var.src_key
    }  
}

resource "azurerm_mssql_database" "db" {
  name = "nu-masternet-dev-cmx-db"
  server_id = azurerm_mssql_server.sql_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb = 10
  sku_name = "S1"
  zone_redundant = false
  storage_account_type = "Local"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    environment = var.env_id
    src = var.src_key
  }
}

resource "azurerm_mssql_firewall_rule" "sql-rule" {
  end_ip_address = "0.0.0.0"
  start_ip_address = "0.0.0.0"
  server_id = azurerm_mssql_server.sql_server.id
  name = "nu-masternet-dev-cmx-sqlserver-rule"

}