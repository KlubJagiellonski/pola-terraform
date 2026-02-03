module "cloudsql" {
  source  = "terraform-google-modules/sql-db/google//modules/postgresql"
  version = "~> 27.1"

  project_id = var.project_id
  region     = var.region
  name       = "${var.name.app}-${var.name.component}-${var.name.env}-db"

  database_version = var.cloudsql_database_version
  tier             = var.cloudsql_tier

  deletion_protection = var.cloudsql_deletion_protection

  disk_type             = var.cloudsql_disk_type
  disk_size             = var.cloudsql_disk_size
  disk_autoresize       = var.cloudsql_disk_autoresize
  disk_autoresize_limit = var.cloudsql_disk_autoresize_limit

  database_flags = [
    {
      name  = "autovacuum"
      value = "on"
    },
    {
      name  = "cloudsql.iam_authentication"
      value = "on"
    },
    {
      name  = "timezone"
      value = "Europe/Warsaw"
    }
  ]

  insights_config = var.cloudsql_insights_enabled ? {
    query_insights_enabled  = true
    query_string_length     = 1024
    record_application_tags = false
    record_client_address   = false
  } : null

  backup_configuration = var.cloudsql_backup_enabled ? {
    enabled                        = true
    start_time                     = var.cloudsql_backup_start_time
    point_in_time_recovery_enabled = true
    transaction_log_retention_days = 7
    backup_retention_settings = {
      retained_backups = var.cloudsql_backup_retained_backups
      retention_unit   = "COUNT"
    }
  } : null

  ip_configuration = {
    ipv4_enabled                                  = false
    private_network                               = module.vpc.network.self_link
    enable_private_path_for_google_cloud_services = true
  }

  maintenance_window_day          = var.cloudsql_maintenance_window_day
  maintenance_window_hour         = var.cloudsql_maintenance_window_hour
  maintenance_window_update_track = var.cloudsql_maintenance_window_update_track

  additional_databases = [
    {
      name      = "pola"
      charset   = "UTF8"
      collation = "en_US.UTF8"
    }
  ]

  iam_users = [
    {
      id    = "pola"
      email = "${var.name.app}-${var.name.component}-${var.name.env}@${var.project_id}.iam.gserviceaccount.com"
      type  = "CLOUD_IAM_SERVICE_ACCOUNT"
    }
  ]

  depends_on = [
    module.vpc
  ]
}
