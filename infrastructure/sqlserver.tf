module "mssql_iis_01" {


   source = "git::https://gitlab.k8s.cloud.statcan.ca/terraform-modules-sql-server/iaas/database-services/terraform-azurerm-sql-server.git?ref=aqdevelopment"
   # The default uses the most recent major version of the terraform-azurerm-sql-server module.
   # WARNING: Changing major versions on existing builds may cause breaking changes.


   # *** START Variables To Set

   host_name            = "stdcsql-re01"
   vm_size              = "Standard_DS12_v2"
   #accelerated_networking = "true or false, verify if vm size supports it (default is true)"
   environment          = "dev"
   sql_version          = "2019"
   collation            = "SQL_Latin1_General_CP1_CI_AS"
   #workloadtype         = "Type of workload (OLTP,DW)"
   dedicated            = "yes"
   disk_preset      = "Sandbox"
   /* If a preset size is not required, comment this variable assignment.
      Available options are S, M, L, XL, XXL.  Please ensure the number of striped disks can be accomodated on your vm_size.
      S = 1024 GB 2 striped disks, M = 2048 GB 2 striped disks, L = 4096 GB 4 striped disks, XL = 8192 GB 8 striped disks, XXL = 16384 GB 16 striped disks
      Default is S
   */
   
  # datadisk_custom       = "Custom size for the data disk"
   /* If a custom size is not required, comment this variable assignment.
      If a disk_preset was not specified, then this value must be set.
      Define a custom size for the data disk in GB (divisible by 8 ex:512).
   */

  # logdisk_custom        = "Custom size for the log disk"
   /* If a custom size is not required, comment this variable assignment.
      If datadisk_custom was used, than this value must be set.
      Define a custom size for the log disk in GB (divisible by 8 ex:512).
   */

   #datadisk_count_custom = "Number of data disks to be used, they will be striped for added performance (ex: 2)"
   /* If a custom disk count is not required, comment this variable assignment.
      If datadisk_custom was used, than this value must be set.
   */

   #logdisk_count_custom  = "Number of log disks to be used, they will be striped for added performance (ex: 2)"
   /* If a custom log count is not required, comment this variable assignment.
      If logdisk_custom was used, than this value must be set.
      Please ensure the number of striped disks can be accomodated on your vm_size
   */

   # *** END Variables To Set


   # Do Not Modify - Managed by Gitlab Runner or defined by SQL Hosting
   domain               = local.stc-domain
   adjoinuser           = local.stc-adjoinuser
   adjoinpassword       = local.stc-adjoinpassword
   location             = var.location
   resource_group       = var.rg
   subnet_id            = local.backCCSubnetRef
 }
