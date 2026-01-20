org_id          = "723682062592"
billing_account = "01BEA5-BE70B4-A5756A"
region          = "europe-central2"
project_id      = "psychic-mason-449108-u3"

terraform_runner_sa_email = "terraform-runner"

labels = {
  org       = "klubjagiellonski"
  app       = "pola"
  iac       = "terraform"
  component = "analytics"
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
  "psychic-mason-449108-u3=>roles/viewer",
  "psychic-mason-449108-u3=>roles/iam.serviceAccountUser",
  "psychic-mason-449108-u3=>roles/serviceusage.serviceUsageAdmin",
  "psychic-mason-449108-u3=>roles/storage.objectAdmin"
]

github_repository             = "KlubJagiellonski/pola-terraform"
workload_identity_pool_id     = "github-actions-pool"
workload_identity_provider_id = "github-actions-provider"
terraform_runner_sa_name      = "terraform-runner"
