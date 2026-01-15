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

variable "labels" {
  description = "Etykiety dla zasobów"
  type = object({
    org       = string
    app       = string
    iac       = string
    component = string
    env       = string
  })
  default = {
    org       = "klubjagiellonski"
    app       = "pola"
    iac       = "terraform"
    component = "backend"
    env       = "prod"
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
  default     = "kj-pola-backend-prod"
}

variable "service_account_roles" {
  description = "Lista ról IAM do przypisania do service account w formacie 'project_id=>role'"
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
