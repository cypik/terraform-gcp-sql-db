# Terraform-gcp-mssql
# Google Cloud Infrastructure Provisioning with Terraform
## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [License](#license)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create Mssql .
## Usage
To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example: _Mssql_

```hcl
  module "mssql" {
    source                  = "git::https://github.com/cypik/terraform-gcp-sql-db.git?ref=v1.0.0"
    name                    = "app"
    environment             = "test"
    user_password           = "foobar"
    random_instance_name    = true
    deletion_protection     = false
    sql_server_audit_config = var.sql_server_audit_config
  }
```
This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs

- `name`  : The name of the mssql-db.
- `environment` : The environment type.
- `project_id` : The GCP project ID.
- `region` : The region the instance will sit in.
- `database_version` : The  SQL Server version to use.
- `user_password` : The password for the user.

## Module Outputs
Each module may have specific outputs. You can retrieve these outputs by referencing the module in your Terraform configuration.

- `name` : The name for Cloud SQL instance.
- `first_ip_address` : The first IPv4 address of any type assigned.
- `connection_name` : The connection name of the instance to be used in connection strings.
- `ip_address` : The first `public (PRIMARY)` IPv4 address assigned for the master instance.
- `private_ip_address` : The first `private (PRIVATE)` IPv4 address assigned for the master instance.
- `self_link` : The URI of the master instance
- `server_ca_cert` : The CA Certificate used to connect to the SQL Instance via SSL.
- `service_account_email_address` : The service account email address assigned to the instance.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/cypik/terraform-gcp-mssql/tree/master/example) directory within this repository.

## Author
Your Name Replace **'[License Name]'** and **'[Your Name]'** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/cypik/terraform-gcp-mssql/blob/master/LICENSE) file for details.
