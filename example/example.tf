provider "google" {
  project = "soy-smile-435017-c5"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### sql-server module call.
#####==============================================================================
module "mssql" {
  source                  = "./../"
  name                    = "app"
  user_name               = "mssql"
  db_name                 = "testdb"
  environment             = "test"
  user_password           = "foobar"
  random_instance_name    = true
  deletion_protection     = false
  sql_server_audit_config = var.sql_server_audit_config
}