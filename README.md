# Azure VM for SQL Server

Creates a Windows Server prepped for SQL Server installation.

Examples can be found [here](examples/).

## Requirements

- Subnet ID
- Runner v3.6.2 or higher is needed.
- Terraform AzureRM v2.20 provider or higher.

## Notes

- Moving to a major module version will destroy your old SQL VM.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| adjoinpassword | Specifies the password of the adjoinuser account. | string | n/a | yes |
| adjoinuser | Specifies the username of the account used to join to the domain. | string | n/a | yes |
| collation | Collation at the instance level for SQL Server | string | `"SQL_Latin1_General_CP1_CI_AS"` | no |)
| datadisk_count_custom | The number of data disks to create if disk_preset is not desired. Multiple disks will be striped. | string | `"0"` | no |
| datadisk_custom | The custom data disk size if a disk_preset is not desired. | string | `"0"` | no |
| disk_preset | Preset disk configurations (S, M, L, XL, XXL). S = 1024 GB 2 striped disks, M = 2048 GB 2 striped disks, L = 4096 GB 4 striped disks, XL = 8192 GB 8 striped disks, XXL = 16384 GB 16 striped disks. | string | `"S"` | no |
| domain | Specifies the domain that the virtual machine should join to. | string | n/a | yes |
| environment | Subscription in which the virtual machine will be built (dev,test,uat,qa,production). | string | n/a | yes |
| host_name | Specifies the name of the virtual machine resource. | string | n/a | yes |
| location | The Azure region where the resources will be created. | string | `"canadacentral"` | no |
| logdisk_count_custom | The number of log disks to create if disk_preset is not desired. Multiple disks will be striped. | string | `"0"` | no |
| logdisk_custom | The custom log disk size if a disk_preset is not desired. | string | `"0"` | no |
| resource_group | The name of the resource group in which resources will be created. | string | n/a | yes |
| sql_version | SQL Server version to build (2017,2019) | string | `"2019"` | no |
| dedicated  | Specifies if the SQL Instance is dedicated to an individual project. | string | `"no"` | no |
| subnet_id | The ID of the Subnet which the Network Interface is connected to. | string | n/a | yes |
| vm_size | Specifies the size of the virtual machine. | string | `"Standard_DS12_v2"` | no |
