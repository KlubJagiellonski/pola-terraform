org_id          = "723682062592"
billing_account = "01BEA5-BE70B4-A5756A"
region          = "europe-central2"
project_id      = "kj-pola-backend-stg"

terraform_runner_sa_email = "terraform-runner"

name = {
  org       = "klubjagiellonski"
  prefix    = "kj"
  app       = "pola"
  iac       = "terraform"
  component = "backend"
  env       = "stg"
}

activate_apis = [
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com",
  "serviceusage.googleapis.com",
  "logging.googleapis.com",
  "monitoring.googleapis.com",
  "storage.googleapis.com",
  "run.googleapis.com",
  "compute.googleapis.com",
  "sqladmin.googleapis.com",
  "servicenetworking.googleapis.com"
]

service_account_roles = [
  "kj-pola-backend-stg=>roles/cloudsql.admin",
  "kj-pola-backend-stg=>roles/compute.networkAdmin",
  "kj-pola-backend-stg=>roles/iam.serviceAccountUser",
  "kj-pola-backend-stg=>roles/viewer",
  "kj-pola-backend-stg=>roles/run.admin",
  "kj-pola-backend-stg=>roles/artifactregistry.reader",
  "kj-pola-backend-stg=>roles/serviceusage.serviceUsageAdmin",
  "kj-pola-backend-stg=>roles/storage.objectAdmin",
  "kj-pola-backend-stg=>roles/servicenetworking.networksAdmin"
]

github_repository             = "KlubJagiellonski/pola-terraform"
workload_identity_pool_id     = "github-actions-pool"
workload_identity_provider_id = "github-actions-provider"
terraform_runner_sa_name      = "terraform-runner"

# VPC Networking Configuration
vpc_subnet_cidr             = "10.0.0.0/24"
vpc_subnet_description      = "Subnet dla Cloud Run Direct VPC Egress i Cloud SQL"
private_service_access_cidr = "10.1.0.0/24"

# Cloud SQL Configuration
cloudsql_database_version                = "POSTGRES_15"
cloudsql_tier                            = "db-f1-micro"
cloudsql_deletion_protection             = false
cloudsql_disk_type                       = "PD_SSD"
cloudsql_disk_size                       = 1
cloudsql_disk_autoresize                 = true
cloudsql_disk_autoresize_limit           = 60
cloudsql_insights_enabled                = true
cloudsql_backup_enabled                  = true
cloudsql_backup_start_time               = "02:00"
cloudsql_backup_retained_backups         = 30
cloudsql_maintenance_window_day          = 1
cloudsql_maintenance_window_hour         = 1
cloudsql_maintenance_window_update_track = "stable"
