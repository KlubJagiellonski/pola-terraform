org_id          = "723682062592"
billing_account = "01BEA5-BE70B4-A5756A"
region          = "europe-central2"
project_id      = "kj-pola-shared-prod"

terraform_runner_sa_email = "terraform-runner"

labels = {
  org       = "klubjagiellonski"
  app       = "pola"
  iac       = "terraform"
  component = "shared"
  env       = "prod"
}

activate_apis = [
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com",
  "serviceusage.googleapis.com",
  "logging.googleapis.com",
  "monitoring.googleapis.com",
  "storage.googleapis.com",
  "artifactregistry.googleapis.com"
]

service_account_roles = [
  "kj-pola-shared-prod=>roles/viewer",
  "kj-pola-shared-prod=>roles/iam.serviceAccountUser",
  "kj-pola-shared-prod=>roles/serviceusage.serviceUsageAdmin",
  "kj-pola-shared-prod=>roles/storage.objectAdmin",
  "kj-pola-shared-prod=>roles/artifactregistry.writer"
]

github_repository             = "KlubJagiellonski/pola-terraform"
workload_identity_pool_id     = "github-actions-pool"
workload_identity_provider_id = "github-actions-provider"
terraform_runner_sa_name      = "terraform-runner"
