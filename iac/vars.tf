variable "env_id" {
  type = string
  description = "environment id"
  default = "dev"
}

variable "subcription_id" {
    type = string
    description = "azure subcription id"
    default = "63091434-861f-47fb-8a02-2a4911c77384"  
}

variable "location" {
   type = string
   description = "region del servicio azure"
   default = "Mexico Central"  
}

variable "src_key" {
  type = string
  description = "origen de creacion del recurso"
  default = "terraform"  
}

variable "sql_pass" {
  type = string
  description = "The SQL Server Password"  
}