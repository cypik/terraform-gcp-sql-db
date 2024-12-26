variable "name" {
  type        = string
  default     = "test"
  description = "Name of the resource. Provided by the client when the resource is created. "
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the resource."
}

variable "managedby" {
  type        = string
  default     = "info@cypik.com"
  description = "ManagedBy, eg 'info@cypik.com'."
}

variable "repository" {
  type        = string
  default     = "https://github.com/cypik/terraform-google-mssql"
  description = "Terraform current module repo"
}


variable "random_instance_name" {
  type        = bool
  default     = false
  description = "Sets random suffix at the end of the Cloud SQL resource name"
}

variable "database_version" {
  type        = string
  default     = "SQLSERVER_2017_STANDARD"
  description = "The database version to use: SQLSERVER_2017_STANDARD, SQLSERVER_2017_ENTERPRISE, SQLSERVER_2017_EXPRESS, or SQLSERVER_2017_WEB"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The region of the Cloud SQL resources"
}

variable "tier" {
  type        = string
  default     = "db-custom-2-3840"
  description = "The tier for the master instance."
}

variable "edition" {
  type        = string
  default     = null
  description = "The edition of the instance, can be ENTERPRISE or ENTERPRISE_PLUS."
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "The zone for the master instance."
}

variable "secondary_zone" {
  type        = string
  default     = null
  description = "The preferred zone for the secondary/failover instance, it should be something like: `us-central1-a`, `us-east1-c`."
}

variable "follow_gae_application" {
  type        = string
  default     = null
  description = "A Google App Engine application whose zone to remain in. Must be in the same region as this instance."
}

variable "activation_policy" {
  type        = string
  default     = "ALWAYS"
  description = "The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
}

variable "availability_type" {
  type        = string
  default     = "ZONAL"
  description = "The availability type for the master instance.This is only used to set up high availability for the MSSQL instance. Can be either `ZONAL` or `REGIONAL`."
}

variable "deletion_protection_enabled" {
  type        = bool
  default     = false
  description = "Enables protection of an instance from accidental deletion protection across all surfaces (API, gcloud, Cloud Console and Terraform)."
}

variable "disk_autoresize" {
  type        = bool
  default     = true
  description = "Configuration to increase storage size."
}

variable "disk_autoresize_limit" {
  type        = number
  default     = 0
  description = "The maximum size to which storage can be auto increased."
}

variable "disk_size" {
  type        = number
  default     = 10
  description = "The disk size for the master instance."
}

variable "disk_type" {
  type        = string
  default     = "PD_SSD"
  description = "The disk type for the master instance."
}

variable "pricing_plan" {
  type        = string
  default     = "PER_USE"
  description = "The pricing plan for the master instance."
}

variable "maintenance_window_day" {
  type        = number
  default     = 1
  description = "The day of week (1-7) for the master instance maintenance."
}

variable "maintenance_window_hour" {
  type        = number
  default     = 23
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
}

variable "maintenance_window_update_track" {
  type        = string
  default     = "canary"
  description = "The update track of maintenance window for the master instance maintenance.Can be either `canary` or `stable`."
}

variable "deny_maintenance_period" {
  type = list(object({
    end_date   = string
    start_date = string
    time       = string
  }))
  default     = []
  description = "The Deny Maintenance Period fields to prevent automatic maintenance from occurring during a 90-day time period. See [more details](https://cloud.google.com/sql/docs/sqlserver/maintenance)"
}

variable "database_flags" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/sqlserver/flags)"
}

variable "active_directory_config" {
  type        = map(string)
  default     = {}
  description = "Active domain that the SQL instance will join."
}

variable "sql_server_audit_config" {
  type        = map(string)
  default     = {}
  description = "SQL server audit config settings."
}

variable "user_labels" {
  type        = map(string)
  default     = {}
  description = "The key/value labels for the master instances."
}

variable "ip_configuration" {
  type = object({
    authorized_networks = optional(list(map(string)), [])
    ipv4_enabled        = optional(bool)
    private_network     = optional(string)
    allocated_ip_range  = optional(string)
    ssl_mode            = optional(string)
  })
  default = {
    authorized_networks = []
    ipv4_enabled        = true
    private_network     = null
    allocated_ip_range  = null
    ssl_mode            = null
  }
  description = "The ip configuration for the Cloud SQL instances."
}

variable "backup_configuration" {
  type = object({
    binary_log_enabled             = bool
    enabled                        = bool
    point_in_time_recovery_enabled = bool
    start_time                     = string
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    binary_log_enabled             = null
    enabled                        = true
    point_in_time_recovery_enabled = null
    start_time                     = null
    transaction_log_retention_days = null
    retained_backups               = null
    retention_unit                 = null
  }
  description = "The database backup configuration."
}

variable "db_charset" {
  type        = string
  default     = ""
  description = "The charset for the default database"
}

variable "db_collation" {
  type        = string
  default     = ""
  description = "The collation for the default database. Example: 'en_US.UTF8'"
}

variable "additional_databases" {
  type = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default     = []
  description = "A list of databases to be created in your cluster"
}

variable "user_password" {
  type        = string
  default     = ""
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
}

variable "additional_users" {
  type = list(object({
    name            = string
    password        = string
    random_password = bool
  }))
  default     = []
  description = "A list of users to be created in your cluster. A random password would be set for the user if the `random_password` variable is set."
  validation {
    condition     = length([for user in var.additional_users : false if user.random_password == true && (user.password != null && user.password != "")]) == 0
    error_message = "You cannot set both password and random_password, choose one of them."
  }
}

variable "root_password" {
  type        = string
  default     = ""
  description = "MSSERVER password for the root user. If not set, a random one will be generated and available in the root_password output variable."
}

variable "create_timeout" {
  type        = string
  default     = "30m"
  description = "The optional timeout that is applied to limit long database creates."
}

variable "update_timeout" {
  type        = string
  default     = "30m"
  description = "The optional timeout that is applied to limit long database updates."
}

variable "delete_timeout" {
  type        = string
  default     = "30m"
  description = "The optional timeout that is applied to limit long database deletes."
}

variable "module_depends_on" {
  type        = list(any)
  default     = []
  description = "List of modules or resources this module depends on."
}

variable "encryption_key_name" {
  type        = string
  default     = null
  description = "The full path to the encryption key used for the CMEK disk encryption"
}

variable "deletion_protection" {
  type        = bool
  default     = true
  description = "Used to block Terraform from deleting a SQL Instance."
}

variable "connector_enforcement" {
  type        = bool
  default     = false
  description = "Enforce that clients use the connector library"
}

variable "time_zone" {
  type        = string
  default     = null
  description = "The time zone for SQL instance."
}

variable "db_name" {
  type        = string
  default     = ""
  description = "The name of the database to be created."
}

variable "user_name" {
  type        = string
  default     = ""
  description = "The name of the default user"
}

variable "enable_default_user" {
  type        = bool
  default     = true
  description = "Enable or disable the creation of the default user"
}
variable "enable_default_db" {
  type        = bool
  default     = true
  description = "Enable or disable the creation of the default database"
}

variable "data_cache_enabled" {
  type        = bool
  default     = false
  description = "Whether data cache is enabled for the instance. Defaults to false. Feature is only available for ENTERPRISE_PLUS tier and supported database_versions"
}

variable "instance_type" {
  type        = string
  default     = "CLOUD_SQL_INSTANCE"
  description = "The type of the instance. The supported values are SQL_INSTANCE_TYPE_UNSPECIFIED, CLOUD_SQL_INSTANCE, ON_PREMISES_INSTANCE and READ_REPLICA_INSTANCE. Set to READ_REPLICA_INSTANCE when primary_instance_name is provided"
}

variable "master_instance_name" {
  type        = string
  default     = null
  description = "Name of the master instance if this is a failover replica. Required for creating failover replica instance. Not needed for master instance. When removed, next terraform apply will promote this failover failover replica instance as master instance"
}