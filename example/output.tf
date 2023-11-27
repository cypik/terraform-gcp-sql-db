output "name" {
  value       = module.mssql.name
  description = "The instance name for the master instance"
}

output "ip_address" {
  value       = module.mssql.ip_address
  description = "The IPv4 addesses assigned for the master instance"
}

output "primary" {
  value       = module.mssql.primary
  sensitive   = true
  description = "The private IP address assigned for the master instance"
}

output "first_ip_address" {
  value       = module.mssql.first_ip_address
  description = "The first IPv4 address of the addresses assigned."
}

output "connection_name" {
  value       = module.mssql.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "self_link" {
  value       = module.mssql.self_link
  description = "The URI of the master instance"
}

output "server_ca_cert" {
  value       = module.mssql.server_ca_cert
  description = "The CA certificate information used to connect to the SQL instance via SSL"
}

output "service_account_email_address" {
  value       = module.mssql.service_account_email_address
  description = "The service account email address assigned to the master instance"
}

output "generated_user_password" {
  description = "The auto generated default user password if not input password was provided"
  value       = module.mssql.generated_user_password
  sensitive   = true
}