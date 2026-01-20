org_id          = "723682062592"
billing_account = "01BEA5-BE70B4-A5756A"
region          = "europe-central2"
project_id      = "kj-pola-backend-prod"

terraform_runner_sa_email = "terraform-runner"

labels = {
  org       = "klubjagiellonski"
  app       = "pola"
  iac       = "terraform"
  component = "backend"
  env       = "prod"
}

activate_apis = [
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com",
  "serviceusage.googleapis.com",
  "logging.googleapis.com",
  "monitoring.googleapis.com",
  "storage.googleapis.com"
]

service_account_roles = [
  "kj-pola-backend-prod=>roles/viewer",
  "kj-pola-backend-prod=>roles/iam.serviceAccountUser",
  "kj-pola-backend-prod=>roles/serviceusage.serviceUsageAdmin",
  "kj-pola-backend-prod=>roles/storage.objectAdmin"
]

github_repository             = "KlubJagiellonski/pola-terraform"
workload_identity_pool_id     = "github-actions-pool"
workload_identity_provider_id = "github-actions-provider"
terraform_runner_sa_name      = "terraform-runner"
