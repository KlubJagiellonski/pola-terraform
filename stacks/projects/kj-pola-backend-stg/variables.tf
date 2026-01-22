variable "org_id" {
  description = "ID organizacji GCP"
  type        = string
  default     = "723682062592"
}

variable "billing_account" {
  description = "ID konta rozliczeniowego GCP"
  type        = string
  default     = "01BEA5-BE70B4-A5756A"
}

variable "region" {
  description = "Region GCP"
  type        = string
  default     = "europe-central2"
}

variable "terraform_runner_sa_email" {
  description = "Email service account runnera Terraform"
  type        = string
  default     = "terraform-runner"
}

variable "name" {
  description = "Etykiety dla zasobów"
  type = object({
    org       = string
    prefix    = string
    app       = string
    iac       = string
    component = string
    env       = string
  })
  default = {
    org       = "klubjagiellonski"
    prefix    = "kj"
    app       = "pola"
    iac       = "terraform"
    component = "backend"
    env       = "stg"
  }
}

variable "activate_apis" {
  description = "Lista API do aktywacji w projekcie"
  type        = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "storage.googleapis.com"
  ]
}

variable "project_id" {
  description = "ID projektu GCP"
  type        = string
  default     = "kj-pola-backend-stg"
}

variable "service_account_roles" {
  description = "Lista ról IAM do przypisania do service account"
  type        = list(string)
  default     = []
}

variable "github_repository" {
  description = "Repozytorium GitHub w formacie 'właściciel/repo'"
  type        = string
  default     = "KlubJagiellonski/pola-terraform"
}

variable "workload_identity_pool_id" {
  description = "ID identity pool"
  type        = string
  default     = "github-actions-pool"
}

variable "workload_identity_provider_id" {
  description = "ID identity provider"
  type        = string
  default     = "github-actions-provider"
}

variable "terraform_runner_sa_name" {
  description = "Nazwa service account dla runnera Terraform"
  type        = string
  default     = "terraform-runner"
}

variable "vpc_subnet_cidr" {
  description = "CIDR dla podsieci VPC."
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_subnet_description" {
  description = "Opis podsieci VPC"
  type        = string
  default     = "Subnet dla Cloud Run Direct VPC Egress i Cloud SQL"
}

variable "private_service_access_cidr" {
  description = "CIDR dla Private Service Access"
  type        = string
  default     = "10.1.0.0/24"
}

variable "cloudsql_tier" {
  description = "Typ maszyny Cloud SQL (np. db-f1-micro, db-n1-standard-1)"
  type        = string
  default     = "db-f1-micro"
}

variable "cloudsql_database_version" {
  description = "Wersja bazy danych PostgreSQL (np. POSTGRES_15, POSTGRES_16)"
  type        = string
  default     = "POSTGRES_15"
}

variable "cloudsql_disk_type" {
  description = "Typ dysku dla Cloud SQL (PD_SSD lub PD_HDD)"
  type        = string
  default     = "PD_SSD"
}

variable "cloudsql_disk_size" {
  description = "Rozmiar dysku Cloud SQL w GB"
  type        = number
  default     = 20
}

variable "cloudsql_disk_autoresize" {
  description = "Czy włączyć automatyczne zwiększanie rozmiaru dysku"
  type        = bool
  default     = true
}

variable "cloudsql_disk_autoresize_limit" {
  description = "Maksymalny rozmiar dysku po automatycznym zwiększeniu w GB"
  type        = number
  default     = 60
}

variable "cloudsql_insights_enabled" {
  description = "Czy włączyć Query Insights"
  type        = bool
  default     = true
}

variable "cloudsql_backup_enabled" {
  description = "Czy włączyć kopie zapasowe"
  type        = bool
  default     = true
}

variable "cloudsql_backup_start_time" {
  description = "Godzina rozpoczęcia kopii zapasowej (format HH:MM)"
  type        = string
  default     = "02:00"
}

variable "cloudsql_backup_retained_backups" {
  description = "Liczba zachowanych kopii zapasowych"
  type        = number
  default     = 30
}

variable "cloudsql_maintenance_window_day" {
  description = "Dzień tygodnia okna konserwacji (1-7, gdzie 1=Sunday)"
  type        = number
  default     = 1
}

variable "cloudsql_maintenance_window_hour" {
  description = "Godzina okna konserwacji (0-23)"
  type        = number
  default     = 1
}

variable "cloudsql_maintenance_window_update_track" {
  description = "Ścieżka aktualizacji okna konserwacji (stable/preview/any)"
  type        = string
  default     = "stable"
}